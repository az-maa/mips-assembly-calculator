.data
msgnb1 : .asciiz "Entrez le 1er entier positif \n"
msgnb2 : .asciiz "Entrez le 2nd entier positif\n"
choicemsg : .asciiz "Faites votre choix : \n"
addimsg : .asciiz "\nTapez 1 pour faire l addition \n"
sousmsg : .asciiz "Tapez 2 pour faire la soustraction \n"
multmsg : .asciiz "Tapez 3 pour faire la multiplication \n"
divmsg : .asciiz "Tapez 4 pour faire la division \n"
modmsg : .asciiz "Tapez 5 pour faire le modulo \n"
negmsg : .asciiz "Tapez 6 pour afficher la negation \n"
exitmsg : .asciiz "Tapez 7 pour quitter le programme \n"
errormsg : .asciiz "La division par 0 est impossible! \n"
resultmsg : .asciiz "Le resultat de votre opperation est :  \n"
.text
.globl main
main:

Saisien1:
li $v0,4 #affichage du msg
sll $0,$0,0
sll $0,$0,0
la $a0,msgnb1 #charger l adresse du message de saisie 1
sll $0,$0,0
sll $0,$0,0
syscall

li $v0,5 #lire le 1er entier
sll $0,$0,0
sll $0,$0,0
syscall

move $t1,$v0 #placer le 1 er nombre saisie dans le registre $t1
sll $0,$0,0
sll $0,$0,0

srl $t4,$t1,31 #extraire le bit de signe de $t1
bne $t4,$0,Saisien1 #si le nombre saisie est negatif on demande de faire une autre saisie
sll $0,$0,0
sll $0,$0,0


Saisien2:
li $v0,4 #affichage du msg
sll $0,$0,0
sll $0,$0,0
la $a0,msgnb2 #charger l adresse du message de saisie 2
sll $0,$0,0
sll $0,$0,0
syscall

li $v0,5
sll $0,$0,0
sll $0,$0,0
syscall

move $t2,$v0 #placer le 2nd nombre saisie dans le registre $t2
sll $0,$0,0
sll $0,$0,0

srl $t5,$t2,31 #extraire le bit de signe de $t2
bne $t5,$0,Saisien2 #si le nombre saisie est negatif on demande de faire une autre saisie
sll $0,$0,0
sll $0,$0,0 

loop: #le menu
li $v0,4 #affichage du msg
sll $0,$0,0
sll $0,$0,0
la $a0,addimsg #charger l adresse du message d'addition
sll $0,$0,0
sll $0,$0,0
syscall

li $v0,4 #affichage du msg
sll $0,$0,0
sll $0,$0,0
la $a0,sousmsg #charger l adresse du message de soustraction
sll $0,$0,0
sll $0,$0,0
syscall

li $v0,4 #affichage du msg
sll $0,$0,0
sll $0,$0,0
la $a0,multmsg #charger l adresse du message de multiplication
sll $0,$0,0
sll $0,$0,0
syscall

li $v0,4 #affichage du msg
sll $0,$0,0
sll $0,$0,0
la $a0,divmsg #charger l adresse du message de division
sll $0,$0,0
sll $0,$0,0
syscall

li $v0,4 #affichage du msg
sll $0,$0,0
sll $0,$0,0
la $a0,modmsg #charger l adresse du message du modulo
sll $0,$0,0
sll $0,$0,0
syscall

li $v0,4 #affichage du msg
sll $0,$0,0
sll $0,$0,0
la $a0,negmsg #charger l adresse du message de la negation
sll $0,$0,0
sll $0,$0,0
syscall

li $v0,4 #affichage du msg
sll $0,$0,0
sll $0,$0,0
la $a0,exitmsg #charger l adresse du message d exit
sll $0,$0,0
sll $0,$0,0
syscall

li $v0,4 #affichage du msg
sll $0,$0,0
sll $0,$0,0
la $a0,choicemsg #charger l adresse du message du choix
sll $0,$0,0
sll $0,$0,0
syscall



li $v0,5 #saisie du choix
sll $0,$0,0
sll $0,$0,0
syscall



move $t0,$v0 #placer le choix dans $t0
sll $0,$0,0
sll $0,$0,0



bne $t0,1,Soustraction   #si le choix est egal a 1 on fait l addition sinon on saute au label Soustraction ou il y les blocs d intructions de soustraction
sll $0,$0,0
sll $0,$0,0
add $t3,$t1,$t2   #$t3 contient le resultat de $t1 + $t2
j Result  # on saute vers le label Result ou on affiche le resultat



Soustraction : bne $t0,2,Multiplication   #si le choix est egal a 2 on fait la soustraction sinon on saute au label Multiplication ou il y les blocs d intructions de multiplication
sll $0,$0,0
sll $0,$0,0
sub $t3,$t1,$t2 #$t3<--$t1-$t2
j Result   # on saute vers le label Result ou on affiche le resultat

 

Multiplication : bne $t0,3,Divison   #si le choix est egal a 3 on fait la multiplication sinon on saute au label Division ou il y les blocs d intructions de division
sll $0,$0,0
sll $0,$0,0
mult $t1,$t2
mflo $t3 #transferer le resultat de la multiplication du registre LO au resgistre $t3
j Result # on saute vers le label Result ou on affiche le resultat

Divison : bne $t0,4,Modulo #si le choix est egal a 4 on fait la division sinon on saute au label Modulo ou il y les blocs d intructions du modulo
sll $0,$0,0
sll $0,$0,0
beq $t2,$0,Erreur1 #tester si la valeur de $t2 est egal a 0. si $t2 == 0 on saute au label Erreur1 qui affiche un msg d erreur et redemande la saisie de n2
sll $0,$0,0
sll $0,$0,0
div $t1,$t2 #transferer le resultat de la division du registre LO au resgistre $t3
mflo $t3
j Result # on saute vers le label Result ou on affiche le resultat



Erreur1 : li $v0,4 #affichage du msg d erreur
sll $0,$0,0
sll $0,$0,0
la $a0,errormsg  #la division par 0 est impossible 
sll $0,$0,0
sll $0,$0,0
syscall
j Saisien2  #on doit re demander la saisie de l entier n2



Modulo : bne $t0,5,Negation #si le choix est egal a 5 on fait le modulo de $t1 mod $t2 sinon on saute au label Negation ou il y les blocs d intructions de negation
sll $0,$0,0
sll $0,$0,0
sll $0,$0,0
sll $0,$0,0
beq $t2,$0,Erreur2 #tester si la valeur de $t2 est egal a 0 . si $t2 == 0 on saute au label Erreur2 qui affiche un msg d erreur et redemande la saisie de n2
sll $0,$0,0
sll $0,$0,0
div $t1,$t2
mfhi $t3 #le reste de la division est le modulo et se trouve dans le registre HI
j Result # on saute vers le label Result ou on affiche le resultat




Erreur2 : li $v0,4 #affichage du msg d erreur
sll $0,$0,0
sll $0,$0,0
la $a0,errormsg #charger un message d erreur comme la division par 0 est impossible
sll $0,$0,0
sll $0,$0,0
syscall
j Saisien2 #on doit re demander la saisie de l entier n2



Negation : bne $t0,6,Exit  #si le choix est egal a 6 on fait la negation de $t1 avec $t2 sinon on saute au label Exit ou il y les blocs d intructions pour arreter le programme
sll $0,$0,0
sll $0,$0,0
nor $t3,$t1,$t2
j Result # on saute vers le label Result ou on affiche le resultat




Exit : bne $t0,7,loop #comme quoi si la valeur du choix ne correspond a aucunes des possibilites on affiche de nouveau le menu et demande un nouveau choix
sll $0,$0,0
sll $0,$0,0
li $v0,10
sll $0,$0,0
sll $0,$0,0
syscall



Result: li $v0,4
sll $0,$0,0
sll $0,$0,0
la $a0,resultmsg
sll $0,$0,0
sll $0,$0,0
syscall #charger un message "le resultat est : "



li $v0,1
sll $0,$0,0
sll $0,$0,0
move $a0,$t3 #quelque soit l operation le registre $t3 contient le resultat
sll $0,$0,0
sll $0,$0,0
syscall



move $t3,$a0
sll $0,$0,0
sll $0,$0,0
j loop #on affiche le menu de nouveau tant que le choix est different de 7 (pour quitter) 