# Scilab_Project_Eva-Clara-Emilie_2022

DM01. 

Quels sont les arguments manquants à ce code, et à quoi servent-ils ?
La valeur de sortie est manquante : le nom du résultat que l’on veut obtenir = signal. La valeur de sortie est ce que l’on cherche à obtenir lorsque l’on fait appel à la fonction. 
Il faut remplacer le X par “signal”.
Il manquait le signe égal entre la valeur de sortie et les valeurs d’entrées. 
Les valeurs d’entrées manquantes : 
“time” : sert à introduire le temps en fonction duquel on va tracer la sinusoïde.
“frequency” : sert à introduire la fréquence de la sinusoïde.

DM03.

6. A quel plateau de 30 s est ce que l’on obtient la VO2 maximale ?
	La réponse est affichée dans le script : "The tray of 30s where we obtain the maximum VO2 is tray number : 13".

9. Comment nommer ce fichier(s) ? Où ranger ce(s)  fichier(s) ?
	Ce fichier a été nommé : “TraysParametersMax.txt”, et enregistré dans le fichier RES. 

10. L’analyse est-elle mieux avec des plateaux de 1 min ? Ou alors avec des plateaux de 15 secondes ? 
Cf graphique.
	En comparant les plateaux de 30sec et les plateaux de 1min, nous constatons que l’analyse des plateaux de 30sec est meilleure car le signal est plus lisse, sans que l’on s’éloigne trop des données initiales. En effet avec les plateaux de 1min on s’éloigne davantage du signal d’origine. 
	En comparant les plateaux de 30sec et de 15sec, nous constatons que le signal par plateaux de 15sec est encore un peu bruité, donc le signal est moins lisse.
	Ainsi la meilleure analyse est avec des plateaux de 30sec.

Organisation.

Organisation Scilab : 

Dans un premier temps, nous avons décidé de travailler chacune de notre côté afin de prendre connaissance des différents DM que nous devions faire et essayer de faire les scripts de chaque DM.
Ensuite, nous avons mis en commun le premier DM  avec ce que nous avions fait chacun de notre côté, ce qui nous a permis de tout terminer ensemble.
Nous avons fait de même pour les autres DM.

Organisation Github : 

Emilie a créé le projet Scilab_Projet_Eva-Clara-Emilie_2022 sur Github. 
Dans la branche principale, nous avons créé 3 fichiers : DAT, PRG et RES. 
Puis, nous avons créé 3 branches : DM01, DM02 et DM03. 
A l’intérieur de chaque branche, nous avons créé 3 sous branches sous la forme de : DM01_Prénom. Dans chacune de nos branches correspondant au DM en question, nous avons donc déposé une partie du code. 
Les parties de code ont été divisées comme tel : 
DM01 : 
- Eva : fonction sinusoïde.
- Emilie : créer une fenêtre vierge avec un numéro aléatoire.
- Clara : utiliser la fonction sinusoïde dans une boucle for pour créer des sinusoïdes avec des fréquences 	différentes.
DM02 : 
- Clara : questions 2, 3, 4 et 9.
- Eva : questions 5 et 8.
- Emilie : questions 6 et 7.
DM03 : 
- Clara : questions 2, 3 et 4.
- Eva : questions 5, 8 et 9.
- Emilie : questions 6 et 7.
Puis Emilie s’est chargée de fusionner les sous branches dans la branche dédiée au DM. 
Enfin, dans le fichier PRG, nous avons placé les scripts complets de chaque DM.


 
