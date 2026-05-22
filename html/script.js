const app = document.getElementById('app');
const activeCards = new Map();

window.addEventListener('message', function(event) {
    const data = event.data;

    if (data.action === "update") {
        updatePlayerCards(data.players);
    } else if (data.action === "hideAll") {
        hideAllCards();
    }
});

function updatePlayerCards(players) {
    const activeIds = new Set();

    players.forEach(player => {
        const playerId = player.id.toString();
        activeIds.add(playerId);

        const xPos = player.x * window.innerWidth;
        const yPos = player.y * window.innerHeight;

        let card = activeCards.get(playerId);
        if (!card) {
            card = createCardElement(player);
            app.appendChild(card);
            activeCards.set(playerId, card);
            
            requestAnimationFrame(() => {
                card.classList.add('active');
            });
        }

        const scale = Math.max(0.65, 1.0 - (player.dist / 14.0));
        
        card.style.transform = `translate3d(${xPos}px, ${yPos}px, 0) translate(-50%, -100%) scale(${scale})`;
        card.style.zIndex = Math.round(1000 - player.dist);

        const jobColor = player.jobColor || '#ffffff';
        const jobGlow = player.jobGlow || 'rgba(255, 255, 255, 0.2)';
        const jobAlpha = player.jobAlpha || 'rgba(255, 255, 255, 0.05)';
        
        card.style.setProperty('--job-color', jobColor);
        card.style.setProperty('--job-color-glow', jobGlow);
        card.style.setProperty('--job-color-alpha', jobAlpha);

        if (player.isTalking) {
            card.classList.add('speaking');
        } else {
            card.classList.remove('speaking');
        }

        const voiceContainer = card._elements.voice;
        const voiceClass = `voice-indicator voice-level-${player.voiceLevel || 2}`;
        if (voiceContainer.className !== voiceClass) {
            voiceContainer.className = voiceClass;
        }

        const nameEl = card._elements.name;
        if (nameEl.textContent !== player.name) {
            nameEl.textContent = player.name;
        }

        const detailsParts = [];
        if (player.job && player.job !== "Civilian") {
            let jobStr = `<span class="job-title" style="color: var(--job-color);">${player.job}</span>`;
            if (player.jobGrade && player.jobGrade !== "None" && player.jobGrade !== "") {
                jobStr += ` <span class="job-grade">(${player.jobGrade})</span>`;
            }
            detailsParts.push(jobStr);
        } else if (player.job) {
            detailsParts.push(`<span class="job-title">${player.job}</span>`);
        }

        if (player.gang && player.gang !== "None" && player.gang !== "") {
            detailsParts.push(`<span class="gang-title" style="color: ${player.gangColor || 'rgba(255, 255, 255, 0.65)'};">${player.gang}</span>`);
        }

        const detailsHTML = detailsParts.join(' <span class="details-divider">•</span> ');
        if (card._currentDetailsHTML !== detailsHTML) {
            card._elements.details.innerHTML = detailsHTML;
            card._currentDetailsHTML = detailsHTML;
        }

        updateCardStates(card, player.states);
    });

    for (let [id, card] of activeCards.entries()) {
        if (!activeIds.has(id)) {
            card.classList.remove('active');
            setTimeout(() => {
                if (!activeCards.has(id)) {
                    card.remove();
                }
            }, 250);
            activeCards.delete(id);
        }
    }
}

function createCardElement(player) {
    const card = document.createElement('div');
    card.className = 'player-card';
    card.id = `player-${player.id}`;

    card.innerHTML = `
        <div class="hud-wrapper">
            <div class="hud-header">
                <span class="id-badge">#${player.id}</span>
                <span class="player-name">${player.name}</span>
                <div class="voice-indicator voice-level-2">
                    <div class="voice-bar"></div>
                    <div class="voice-bar"></div>
                    <div class="voice-bar"></div>
                </div>
            </div>
            <div class="hud-details"></div>
            <div class="hud-footer" style="display: none;"></div>
        </div>
    `;

    card._elements = {
        wrapper: card.querySelector('.hud-wrapper'),
        name: card.querySelector('.player-name'),
        voice: card.querySelector('.voice-indicator'),
        details: card.querySelector('.hud-details'),
        footer: card.querySelector('.hud-footer')
    };

    card._currentDetailsHTML = '';
    card._currentStatesKey = '';

    return card;
}

function updateCardStates(card, states) {
    const footer = card._elements.footer;

    if (!states || states.length === 0) {
        if (footer.style.display !== 'none') {
            footer.style.display = 'none';
            footer.innerHTML = '';
            card._currentStatesKey = '';
        }
        return;
    }

    const statesKey = states.map(s => s.name).join(',');
    if (card._currentStatesKey === statesKey) return;
    card._currentStatesKey = statesKey;

    footer.innerHTML = '';
    footer.style.display = 'flex';

    states.forEach(state => {
        const badge = document.createElement('div');
        badge.className = `state-badge state-${state.name.toLowerCase()}`;

        let iconName = state.icon || "question";
        if (iconName === "heart-broken") iconName = "heart-crack";
        const iconClass = `fa-solid fa-${iconName}`;
        const labelText = state.label || state.name;

        badge.innerHTML = `<i class="${iconClass}"></i><span>${labelText}</span>`;
        footer.appendChild(badge);
    });
}

function hideAllCards() {
    activeCards.forEach(card => {
        card.remove();
    });
    activeCards.clear();
}
