.data # En la seccion data se declaran y se inicializan las variables
registro1: .asciiz "Ingrese el numero de serie para Fibonacci\n"
registro2: .asciiz "El valor es:\n"
mensaje: .asciiz "El valor es:\n0"

.text

# Mostrar registro1
li $v0, 4
la $a0, registro1
syscall

# Leer un entero
li $v0, 5
syscall

beq $v0, 0, igualAcero # La instruccion beq permite el redireccionamiento basado en el valor de dos registros

# Invocar a la serie
move $a0, $v0
jal fibonacci # La instruccion jal guarda la direccion de retorno antes de pasar a la funcion
move $a1, $v0 # guarda un valor de retorno a a1

# Mostrar el registro2
li $v0, 4
la $a0, registro2
syscall

# Mostrar el resultado
li $v0, 1
move $a0, $a1
syscall

# Salir del programa
li $v0, 10
syscall



# Funcion de Fibonnaci
fibonacci:
addi $sp, $sp, -12 # La instruccion addi almacena el resultado del registro de destino
sw $ra, 8($sp) # La instruccion sw almacena informacion a una direccion especifica
sw $s0, 4($sp)
sw $s1, 0($sp)
move $s0, $a0
li $v0, 1 # Retorna un valor para la condicion terminal
ble $s0, 0x2, fibonacciSalida # Revisa la condicion terminar
addi $a0, $s0, -1 # Establece argumentos para una llamada recursiva
jal fibonacci
move $s1, $v0 # Almacena el resultado de Fibonacci(n-1) a s1
addi $a0, $s0, -2 # Establece argumentos para un llamado recursivo a Fibonacci(n-2)
jal fibonacci
add $v0, $s1, $v0 # Agrega el resultado (n-1)

fibonacciSalida:

lw $ra, 8($sp)
lw $s0, 4($sp)
lw $s1, 0($sp)
addi $sp, $sp, 12
jr $ra
# Fin del programa

igualAcero:
li $v0, 4
la $a0, mensaje
syscall
