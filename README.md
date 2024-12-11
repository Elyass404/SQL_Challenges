# SQL_Challenges
# Conception de la Base de Données et Documentation SQL/ERD pour Unity Care Clinic

## Contexte du Projet
Ce projet vise à concevoir une base de données efficace et bien structurée pour soutenir l'ensemble des fonctionnalités de Unity Care Clinic, garantissant une gestion optimale des données.

## Objectif
Concevoir et implémenter une base de données pour Unity Care Clinic, permettant la gestion des départements, médecins, patients, chambres, admissions, rendez-vous, médicaments, prescriptions et personnel administratif. Le système doit être fiable, sécurisé, évolutif et performant.

## Description Fonctionnelle
La base de données répond aux besoins d’un système de gestion hospitalière en assurant la gestion efficace des données liées aux départements, médecins, patients, chambres, admissions, rendez-vous, médicaments, prescriptions et personnel administratif.

## Tables de la Base de Données
Les tables de la base de données sont conçues selon le schéma ERD, incluant :

- Départements
- Médecins
- Patients
- Chambres
- Admissions
- Rendez-vous
- Médicaments
- Prescriptions
- Personnel administratif

## Exercices SQL
1. **CRUD Operations** : Insérer un nouveau patient nommé "Alex Johnson", né le 15 juillet 1990, de sexe masculin, avec le numéro de téléphone "1234567890".
2. **SELECT Statement** : Récupérer tous les départements avec leurs emplacements.
3. **ORDER BY Clause** : Lister tous les patients, triés par date de naissance dans l'ordre croissant.
4. **DISTINCT** : Récupérer tous les sexes des patients enregistrés, sans doublons.
5. **LIMIT Clause** : Récupérer les trois premiers médecins dans la table `doctors`.
6. **WHERE Clause** : Récupérer les informations des patients nés après l'année 2000.
7. **Logical Operators** : Récupérer les médecins des départements "Cardiology" et "Neurology".
8. **Special Operators** : Lister les admissions entre le 1er et le 7 décembre 2024.
9. **Conditional Expressions** : Ajouter une colonne catégorisant les patients en "Enfant", "Adulte", ou "Senior" selon leur âge.
10. **Aggregate Functions** : Compter le nombre total de rendez-vous enregistrés.
11. **COUNT avec GROUP BY** : Compter le nombre de médecins dans chaque département.
12. **AVG** : Calculer l'âge moyen des patients.
13. **MAX** : Trouver la date et l'heure du dernier rendez-vous enregistré.
14. **SUM** : Calculer le total des admissions pour chaque chambre.
15. **Constraints** : Récupérer tous les patients dont le champ email est vide.
16. **Jointure** : Récupérer les rendez-vous avec les noms des médecins et des patients.
17. **DELETE** : Supprimer tous les rendez-vous programmés avant 2024.
18. **UPDATE** : Changer le nom du département "Oncology" en "Cancer Treatment".
19. **HAVING Clause** : Lister les genres ayant au moins deux patients.
20. **Créer une vue** : Créer une vue listant toutes les admissions en cours.

## User Stories
- En tant que responsable de la base de données hospitalière :
  - Concevoir un schéma de base de données permettant de gérer efficacement les départements, médecins, patients, et rendez-vous.
  - Documenter les relations entre les entités avec des diagrammes UML.
  - Écrire des scripts SQL pour créer la base de données.
  - Planifier des sauvegardes automatiques pour éviter toute perte de données.
  - S'assurer que la base de données est évolutive pour répondre à la croissance future de l’hôpital.