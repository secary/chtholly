q21_seconds = 19191
dict_sin = {'day': 24*60*60, 'hour': 60*60, 'min': 60, 'second': 1}

def add_result(result, timechange, amount):
    if amount not in result:                    
        result[amount] = 0
    
    result[amount] += timechange

def change_time(time):
    results = {}
    output = []
    for key in dict_sin:
        if key in dict_sin:
            timechange = time // dict_sin[key]
            time = time - dict_sin[key] * timechange
            add_result(results, timechange, key)
    
    for key, value in results.items():
        if value == 1:
            output.append(str(value) + ' ' + key)
        else:
            output.append(str(value) + ' ' + key + 's')
    return output

output21 = change_time(q21_seconds)
print(output21)