document.addEventListener('DOMContentLoaded', function() {
    // Přidání event listenerů, pokud je potřeba
    document.querySelectorAll('li').forEach(item => {
        item.addEventListener('click', event => {
            alert('Klikli jste na položku: ' + event.target.textContent);
        });
    });
});