import argparse
parser = argparse.ArgumentParser(description=' ')
parser.add_argument('--cidr-mask', type=str, help=' ')
parser.add_argument('--ip', help=' ')
n = parser.parse_args()

ip_2=''              #
m=n.ip.split('.')    #
m1=n.cidr_mask.split('/')
m2=int(m1[1])
firs_octet=m[0]       #
for j in m:              #  Беру арумент,разделенный ".", задаю цикл,перевожу в 2-ый вид,добовляю в новую строку
 f=bin(int(j))[2:].zfill(8)  #
 ip_2+=f                     #
 
mask_bits = '1' * m2 + '0'* (32 - m2) #                  Делаю логическое And и получаю маску подсети
mask_octets = [int(mask_bits[i:i + 8], base=2) for i in range(0, 32, 8)] #

num=0                        #
mask_1=0
mask_2=''
ip_last=''
ip_last_user=''
first_user=''
for i in mask_bits:           # Здесь я ипоьзую циклы для того чтобы преоброзовать в 2-ый нужные мне элементы:Первый
   if i == '1':                #Последный,Широковещятельный
     mask_1+=1

for i in ip_2:
  num+=1
  mask_2+=i
  ip_last+=i
  ip_last_user+=i
  first_user+=i
  if num==mask_1:
    break                         #

ip_last_user+='1'*(31-mask_1)+'0'                                                       #
ip_adress_last_host = [int(ip_last_user[i:i + 8], base=2) for i in range(0, 32, 8)]      #
ip_last+='1'*(32-mask_1)
limited_broadcast_address = [int(ip_last[i:i + 8], base=2) for i in range(0, 32, 8)]      #Тут использую логическое AND
mask_2+='0'*(32-mask_1)                                                                    #И получаю нужные данные
adress_subnet = [int(mask_2[i:i + 8], base=2) for i in range(0, 32, 8)]
first_user+='0'*(31-mask_1)+'1'
ip_adress_firs_host = [int(first_user[i:i + 8], base=2) for i in range(0, 32, 8)]            #

print(f'Адрес подсети:{ adress_subnet}')
print(f'Маска подсети:{mask_octets}')
print(f'IP адреса первого хоста:{ip_adress_firs_host}')
print(f'IP адреса последнего хоста:{ip_adress_last_host}')
print(f'Широковещательный адрес:{limited_broadcast_address}')


if 0 < int(firs_octet) <=127:
  print('Класc подсети: A')
elif 127 < int(firs_octet) <=191:
  print('Класc подсети: B')
elif 191 < int(firs_octet) <=223:
  print('Класc подсети: C')
elif 223 < int(firs_octet) <=229:
  print('Класc подсети: D')
elif 229 < int(firs_octet) <=255:
  print('Клаcс подсети: E')
