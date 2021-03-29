GUERET Morgan  
CARDOSO Simon  

***

# Projet annuel

Ce projet consiste en la mise en place d'un ensemble de serveurs web exécutant *nodejs* pouvant recevoir des  
tâches à l'aide de *Ansible*.  
Le projet permet de présenter l'automatisation de tâches en direction d'un ensemble de machines (serveurs)  
Les fichiers et dossiers disponibles permettent la mise en place et le déploiement de notre projet annuel.  

## Organisation :

Le dossier comporte:
- *ansible/* : contient les différents fichiers de configuration pour *ansible* ainsi que les playbooks  
- *docker/* : contient le fichier de création des *dockers*  
- *update_dockers_ips/* : contient le code *python* ainsi que les templates pour mettre à jour les ips  

- *projet_annuel_ansible.gns3project* : le projet gns3 en version portable  
- *run.sh* : script principal, permet de lancer les playbooks mais aussi de mettre à jour les ips selon les  
paramètres passés (*./run.sh -h* : pour afficher l'aide)
- *util.txt* : ensemble de commandes utiles pour  le bon fonctionnement au cas où



## Prérequis : 

- *docker*
- *ansible*
- *gns3* et la librairie *virt-manager*
- interfaces *tap0* avec comme adresse ip *10.0.1.1*
- sur la vm, configurer deux interfaces : en nat et par pont 
- laisser le nom du projet gns3 tel quel 

## Lancement :

Pour utiliser notre projet il faut pour commencer 
- construire le *docker* pour les serveurs :  
``` bash
cd docker/
docker build -t ubuntu_nodejs .
```  
- ajouter à gns3 le *docker* créé dans les préférences (avec 2 adapteurs) puis importer notre projet gns3.  

- mettre à jour les adresses ips en lançant *run.sh* avec le paramètre *-i*  
``` bash
./run.sh -i
```  

- démarrer toutes les machines dans gns3 (ensuite atteindre quelques secondes)

- vous pouvez maintenant utiliser les playbooks *ansible*  
Le plus simple est d'exécuter le fichier *run.sh* avec les paramètres souhaités (voir *./run.sh -h*)  

A noter : il peut y avoir un problème avec l'exécution du script si par exemple les servers nodejs sont  
arrêtés et que nous demandons de les arrêter à nouveau  
Ou bien si nous demandons de supprimer les processus avant le déploiement  
  
