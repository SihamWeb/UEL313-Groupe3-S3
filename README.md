# UEL313-Groupe3-S3

### 🎯 Objectif
Ce projet est utilisé dans le cadre de l'UE L313 de notre formation, en Licence Professionnel Métiers de l'informatique - Applications Web, à l'Université de Limoges. 
L'objectif principal consiste à aborder les différents aspects et technologies relatifs à la création d'un projet dans son intégralité, impliquant la manipulation de différentes technologies, framework et langages. Nous serons en mesure de déployer une stratégie de conception permettant la prise en main d'un projet existant, y compris face à un écosystème technique peu maîtrisé et inconnu.</br> 
</br>

### 🤝 Contributeurs
Dylan Louichon (📧 dylan.louichon@etu.unilim.fr)<br>
Siham Charef (📧 siham.charef@etu.unilim.fr)<br>
Valentine Maillard (📧 valentine.maillard@etu.unilim.fr)</br>
</br>

### 📚 Template de départ
Pour effectuer ce travail, nous sommes partis du <a href="https://framagit.org/BSP/watson" target="_blank">`template Watson`</a>.</br>

<img src="https://i.ibb.co/M9TtGCF/Watson.png" alt="Watson" border="0" width="800px">
<img src="https://i.ibb.co/H7yhKG6/git.png" alt="git" border="0" width="800px">

</br>

### 📜 Répartition des tâches
`Dylan` : Création du flux RSS qui répertorie les 15 derniers liens.</br>
`Siham` : Système de pagination limitant l'affichage de chaque page à 15 liens.</br>
`Valentine` : Enrichissement visuel de l'application (CSS, JS, Bootstrap...).</br>
</br>

### 📶 Flux RSS
Le flux RSS généré devra lister automatiquement les 15 derniers liens publiés sur Watson. Autrement dit, à chaque fois que l'on rajoute, modifie ou supprimons un lien, le RSS est automatiquement mis à jour.</br> 
En outre, il devra répondre aux différentes normes RSS 2.0 et être valide. Pour s'en assurer, nous avons utilisés un outil en ligne comme celui proposé par le <a href="https://validator.w3.org/feed/" target="_blank">`W3C`</a>.</br>
</br>
<img src="https://i.ibb.co/ZS2MQFF/validrss.png" alt="validrss" border="0" witdh="180px"></br>
</br>
<ins>Prévisualisation du fichier rss.xml :</ins></br>
</br>
<img src="https://i.ibb.co/3fyyJ9L/rss.png" alt="rss" border="0" height="800px">
</br></br>

### 🔢 Système de pagination
L'actuel espace d'administration de Watson propose l'affichage des liens sous forme d'une longue liste présente dans un onglet géré par Bootstrap. Il faut donc mettre en place un système de pagination sur cette liste, en limitant l'affichage de chaque page à 15 liens.</br>
</br>
<img src="https://i.ibb.co/gtPBXnx/pagination.png" alt="pagination" border="0" witdh="180px"></br>
</br>
<ins>Extrait du code :</ins></br>
</br>
<img src="https://i.ibb.co/fv1v6dj/pagination-code.png" alt="pagination-code" border="0" height="250px">
<img src="https://i.ibb.co/3CDLsJq/pagination-code3.png" alt="pagination-code3" border="0" height="500px"></br>
</br>

### 🧑‍🎨 Visuel de l'application
Le rendu visuel de Watson se base sur l'utilisation de différentes librairies côté client, telle que Bootstrap (CSS & JS) ou encore jQuery.
Il s'agit donc d'enrichir le rendu visuel de Watson. Nous sommes libres de complexifier l'interface selon nos aisances et vos envies. À nous d'être imaginatif et cohérent !</br>
</br>
`• Ajout de templates TWIG`<br>
`• changement de couleurs`<br>
`• polices`<br>
`• agencements d'éléments`<br>
`• ajout de fonctionnalités annexes (fenêtres modales, accordéons, etc...)`<br>
</br>
</br><img src="https://i.ibb.co/kQFTbgM/design.png" alt="design" border="0" witdh="300px">
