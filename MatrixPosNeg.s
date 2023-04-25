.data
N:
.word 5
M:
.word 6
matrix:
.word 2 1 4 3 -9
.word -4 3 5 7 8
.word -6 -7 -8 -9 -1
.word 1 2 3 4 5
.word 1 3 3 7 -8
.word -7 -1 -2 -5 6
posNumCnt:
.word 0
negNumCnt:
.word 0

.text

main:
la t0, N # загрузка адреса N
lw a2, 0(t0) # загрузка значения N
la t0, M # загрузка адреса M
lw a3, 0(t0) # загрузка значения M
la a4, matrix # загрузка адреса первого элемента массива
la a5, posNumCnt # загрузка адреса posNumCnt
la a6, negNumCnt # загрузка адреса negNumCnt
call process
call print
sw s1, 0(a5) # выгрузка posNumCnt
sw s2, 0(a6) # выгрузка negNumCnt
call exit

process:
li s1, 0 # регистр для posNumCnt
li s2, 0 # регистр для negNumCnt
j rowCycle # переход на цикл проверки строки

exitFromRowCycle:
ret

rowCycle:
li t0, 0 # счетчик строк
continueRowCycle:
bge t0, a2, exitFromRowCycle # если t0 >= a2, то перейти на выход из цикла проверки строки
addi t0, t0, 1 # инкрементирование счетчика строк
j columnCycle # переход на цикл проверки столбца
exitFromColumnCycle:
j continueRowCycle

columnCycle:
li t1, 0 # счетчик столбцов
continueColumnCycle:
bge t1, a3, exitFromColumnCycle # если t1 >= a3, то перйти на выход из цикла проверки столбца
addi t1, t1, 1 # инкрементирование счетчика столбцов
lw s9, 0(a4) # загрузка значения из матрицы
addi a4, a4, 4 # инкрементирование адреса матрицы
bgtz s9, incrementPosCnt # если значение массива > 0, то добавить 1
bltz s9, incrementNegCnt # если значение массива > 0, то добавить 1
j continueColumnCycle

incrementPosCnt:
addi s1, s1, 1
j continueColumnCycle

incrementNegCnt:
addi s2, s2, 1
j continueColumnCycle

print:
li x10, 1 # системный вызов для вывода int значения
mv x11, s1 # содержимое х11 будет выведено в консоль
ecall
li x10, 11 # системный вызов для вывода char 
li x11, 13 # новая линия
ecall
li x10, 1 
mv x11, s2 
ecall
li x10, 11 
li x11, 13 
ecall
ret

exit:
addi a0, x0, 10
ecall