q20_amount = 1919
dict_deno_singular = {'20':'twenty','10':'ten','5':'five','2':'two','1':'one'}
dict_deno_plural = {'20':'twenties','10':'tens','5':'fives','2':'twos','1':'ones'}

def change(money):
    for v in dict_deno_singular.keys():
        result = []
        result.append(money//int(v))
        return result
change(q20_amount)