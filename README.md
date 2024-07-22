## Explication code foundry

### Script pour addPoint : check
J'ai du passer par un contrat intermédiaire pour afin d'appeler la fonction addPoint de deux addresses différentes.

### Script pour transfer : check
J'essaye de store 1000001 (soit 1 de plus que le if de la fonction transfer)

### Script pour password : check
Afin d'obtenir les points, j'instancie un hackMeIfYouCan avec un password puis je test la fonction sendPassword avec le bon mot de passe 

### Script pour receive : check
Pour obtenir les points ici, il quffit juste d'avoir un msg.value et d'envoyer une contribution au SC 

### Script pour sendKey : check
J'initialise hackMeIfYouCan avec un password et un tableau de 16 cases et je rentre une clé au format hexadécimal à la 13ème case ([12]). Ensuite, je test la fonction sendKey avec la clé en question.

### Script pour Flip : nocheck
Transaction failure (besoin de le déployer 10fois pour que ça fonctionne)
