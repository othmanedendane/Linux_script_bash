#!/bin/bash

# Projet



# Boucle infinie avec while true .... pour afficher le menu
while true
do
clear

cat << FIN
	***************************************
	*   Systeme de gestion des usagers    *
	***************************************
	*                                     *
	* 1 - Creer un usager                 *
	*                                     *	
	* 2 - Supprimer un usager             *
	*                                     *		
	* 3 - Renetialiser un mot de passe    *
	*                                     *	
	* 4 - lister les usagers              *
	*                                     *
	* 5 - Quitter                         *	
	*                                     *			
	***************************************
	*   Faire un choix entre 1 et 5       *
	***************************************
FIN

# Invite pour la saisie du choix
  echo
  read -p "Votre choix: " CHOIX

 case $CHOIX in
	1)echo "Creer un usager..."
	read -p "Saisir le nom du compte: " COMPTE
	RESULTAT=`cat /etc/passwd | grep $COMPTE`
	if [ -z "$RESULTAT" ] 
	then
		useradd $COMPTE
		echo "Creation de l'usager $COMPTE complétée avec succès"
		echo "==============================================="
		id $COMPTE
		echo "/!\ Attetion le compte est desactive, pour activer veuillez choisir le numero 3"
		echo "==============================================="
		
	else
		
			echo " L'usager $COMPTE existe..."
			id $COMPTE	
			
	fi
		read -p "Appuyer sur une touche pour continuer..."
		;;
		
	2)echo "Supprimer un usager..."
	read -p "Saisir le nom du compte: " DCOMPTE
	RESULTAT=`cat /etc/passwd | grep $DCOMPTE`
	if [ -z "$RESULTAT" ] 
	then
	
		echo " $DCOMPTE n'existe pas..."
		echo " Veuillez entrer un compte deja creer"
		
	else
		
			userdel -r $DCOMPTE
			echo "==============================================="
			echo " $DCOMPTE supprime avec succes..."
			echo "==============================================="
				
			
	fi
		read -p "Appuyer sur une touche pour continuer..."
		;;
	3)echo "Renitialiser un mot de passe"
	read -p "Saisir le nom du compte: " YCOMPTE
	RESULTAT=`cat /etc/passwd | grep $YCOMPTE`
	if [ -z "$RESULTAT" ] 
	then
	
		echo " $YCOMPTE n'existe pas..."
		echo " Veuillez entrer un compte deja creer"
		
	else
		
			passwd $YCOMPTE
			echo "==============================================="
			echo " Réinitialisation du mot de passe de l'usager $YCOMPTE complétée avec succès..."
			echo " $YCOMPTE activé..."
			echo "==============================================="
				
			
	fi
		read -p "Appuyer sur une touche pour continuer..."
		;;
	4)echo "afficher la liste des usagers"
	echo "*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*="
	echo "*=*=*=*=*=*=*=Liste des usagers*=*=*=*=*=*=*=*=*="
	cat /etc/passwd | grep bash$ | gawk -F ":" '{print "\t" $1}'
	echo "*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*="
	read -p "Appuyer sur une touche pour continuer..."
	;;
	5)read -p "Voulez-vous vraiment quitter ? [o/N]" FIN
	if [ $FIN = o ] 
	then
		break
	
	else
		
		read -p "Votre choix: " CHOIX

	fi
	;;
	6)if [ $CHOIX > 5 ] 
	then
		echo "Choix invalide...Veuillez entrer un numero entre 1 et 5 "
	fi
		read -p "Appuyer sur une touche pour continuer...";;

esac


		
done
