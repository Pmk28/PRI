document.addEventListener('DOMContentLoaded', function() {
    // Přidání event listenerů pro všechny odkazy uvnitř navigačního panelu
    document.querySelectorAll('nav a').forEach(item => {

        // Přidání event listeneru pro kliknutí
        item.addEventListener('click', event => {
            if (event.target.textContent === 'Logout') {
                alert('Klikli jste na položku: ' + event.target.textContent);
            }
        });

        // Přidání event listeneru pro pohyb myši
        item.addEventListener('mouseover', event => {
            event.target.style.textDecoration = 'underline';
            event.target.style.cursor = 'pointer';
        });

        // Přidání event listeneru pro opuštění myší
        item.addEventListener('mouseout', event => {
            event.target.style.textDecoration = 'none';
            event.target.style.cursor = 'default';
        });
    });
});