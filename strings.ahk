#Requires AutoHotkey v2.0


; Define the help texts.
HelpText_EN := "To use the F13-F24 keys, enable the Caps Lock key. When Caps Lock is on, the F1-F12 keys will function as F13-F24.`n`nTo use the standard F1-F12 keys, simply disable the Caps Lock key.`n`nYou can customize the icons by replacing the F13-OFF.ico and F13-ON.ico files in the application's directory."
HelpText_IT := "Per utilizzare i tasti F13-F24, abilita il tasto Bloc Maiusc. Quando Bloc Maiusc è attivato, i tasti F1-F12 funzioneranno come F13-F24.`n`nPer utilizzare i tasti standard F1-F12, disabilita semplicemente il tasto Bloc Maiusc.`n`nPuoi personalizzare le icone sostituendo i file F13-OFF.ico e F13-ON.ico nella directory dell'applicazione."
HelpText_DE := "Um die Tasten F13-F24 zu verwenden, aktivieren Sie die Feststelltaste. Wenn die Feststelltaste aktiviert ist, fungieren die Tasten F1-F12 als F13-F24.`n`nUm die Standardtasten F1-F12 zu verwenden, deaktivieren Sie einfach die Feststelltaste.`n`nSie können die Symbole anpassen, indem Sie die Dateien F13-OFF.ico und F13-ON.ico im Verzeichnis der Anwendung ersetzen."
HelpText_ES := "Para usar las teclas F13-F24, habilita la tecla Bloq Mayús. Cuando Bloq Mayús está activado, las teclas F1-F12 funcionarán como F13-F24.`n`nPara usar las teclas estándar F1-F12, simplemente desactiva la tecla Bloq Mayús.`n`nPuedes personalizar los iconos reemplazando los archivos F13-OFF.ico y F13-ON.ico en el directorio de la aplicación."
HelpText_FR := "Pour utiliser les touches F13-F24, activez la touche Verr Maj. Lorsque Verr Maj est activé, les touches F1-F12 fonctionnent comme F13-F24.`n`nPour utiliser les touches standard F1-F12, désactivez simplement la touche Verr Maj.`n`nVous pouvez personnaliser les icônes en remplaçant les fichiers F13-OFF.ico et F13-ON.ico dans le répertoire de l'application."

AboutText_EN := "Hey there! I'm Centomila, the creator of this little application.`n`n" . 
                "I hope you found it useful. Remember, it's free and doesn't collect any data.`n`n" . 
                "If you feel grateful or if it solved a problem for you, why not give my music a listen and/or share it?`n`n" . 
                "You can find links to all the streaming platforms (even the free ones) on my website:`n`n" . 
                "https://centomila.com`n`n" . 
                "No cookies, newsletters, popups, ads, or analytics. Just music and a bit of digital art.`n`n" . 
                "If it's not your style, that's okay. I won't be offended :). Maybe you know someone who might like it.`n`n" . 
                "Thanks for your support! 🫂`n`n" . 
                "---`n`n" . 
                "Press YES to open centomila.com / Press NO to close this window"

AboutText_IT := "Ciao! Sono Centomila, l'autore di questa piccola applicazione.`n`n" . 
                "Spero che ti sia stata utile. Ricorda che è gratuita e non raccoglie dati di alcun tipo.`n`n" . 
                "Se ti senti grato o se ti ha risolto un problema, che ne dici di ascoltare e/o condividere la mia musica?`n`n" . 
                "Puoi trovare i link a tutte le piattaforme di streaming (anche quelle gratuite) sul mio sito web:`n`n" . 
                "https://centomila.com`n`n" . 
                "Niente cookie, newsletter, popup, pubblicità o analisi. Solo musica e un po' di arte digitale.`n`n" . 
                "Se non è il tuo genere, non fa niente. Non mi offenderò :). Forse conosci qualcuno a cui potrebbe piacere.`n`n" . 
                "Grazie per il tuo supporto! 🫂`n`n" . 
                "---`n`n" . 
                "Premi SÌ per aprire centomila.com / Premi NO per chiudere questa finestra"

AboutText_DE := "Hallo! Ich bin Centomila, der Schöpfer dieser kleinen Anwendung.`n`n" . 
                "Ich hoffe, du fandest sie nützlich. Denk daran, sie ist kostenlos und sammelt keine Daten.`n`n" . 
                "Wenn du dankbar bist oder wenn sie ein Problem für dich gelöst hat, warum hörst du nicht mal in meine Musik rein und/oder teilst sie?`n`n" . 
                "Auf meiner Website findest du Links zu allen Streaming-Plattformen (auch den kostenlosen):`n`n" . 
                "https://centomila.com`n`n" . 
                "Keine Cookies, Newsletter, Pop-ups, Werbung oder Analysen. Nur Musik und etwas digitale Kunst.`n`n" . 
                "Wenn es nicht dein Stil ist, ist das okay. Ich bin nicht beleidigt :). Vielleicht kennst du jemanden, dem es gefallen könnte.`n`n" . 
                "Danke für deine Unterstützung! 🫂`n`n" . 
                "---`n`n" . 
                "Drücke JA, um centomila.com zu öffnen / Drücke NEIN, um dieses Fenster zu schließen"

AboutText_ES := "¡Hola! Soy Centomila, el creador de esta pequeña aplicación.`n`n" . 
                "Espero que te haya sido útil. Recuerda que es gratuita y no recopila datos.`n`n" . 
                "Si te sientes agradecido o si te ha resuelto un problema, ¿por qué no escuchas mi música y/o la compartes?`n`n" . 
                "Puedes encontrar enlaces a todas las plataformas de streaming (incluso las gratuitas) en mi sitio web:`n`n" . 
                "https://centomila.com`n`n" . 
                "Sin cookies, boletines, ventanas emergentes, anuncios o análisis. Solo música y un poco de arte digital.`n`n" . 
                "Si no es tu estilo, no pasa nada. No me ofenderé :). Tal vez conozcas a alguien a quien le guste.`n`n" . 
                "¡Gracias por tu apoyo! 🫂`n`n" . 
                "---`n`n" . 
                "Presiona SÍ para abrir centomila.com / Presiona NO para cerrar esta ventana"

AboutText_FR := "Salut! Je suis Centomila, le créateur de cette petite application.`n`n" . 
                "J'espère que vous l'avez trouvée utile. Rappelez-vous, elle est gratuite et ne collecte aucune donnée.`n`n" . 
                "Si vous êtes reconnaissant ou si elle a résolu un problème pour vous, pourquoi ne pas écouter ma musique et/ou la partager?`n`n" . 
                "Vous pouvez trouver des liens vers toutes les plateformes de streaming (même les gratuites) sur mon site web:`n`n" . 
                "https://centomila.com`n`n" . 
                "Pas de cookies, newsletters, popups, publicités ou analyses. Juste de la musique et un peu d'art numérique.`n`n" . 
                "Si ce n'est pas votre style, ce n'est pas grave. Je ne serai pas offensé :). Peut-être connaissez-vous quelqu'un à qui cela pourrait plaire.`n`n" . 
                "Merci pour votre soutien! 🫂`n`n" . 
                "---`n`n" . 
                "Appuyez sur OUI pour ouvrir centomila.com / Appuyez sur NON pour fermer cette fenêtre"
