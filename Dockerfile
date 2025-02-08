FROM python:3.8.19-slim
WORKDIR /
RUN apt update && apt -y install curl git wget sudo ufw
RUN mport concurrent.futures

def task(i):
    # Do some computation here
    return i * 2

with concurrent.futures.ThreadPoolExecutor() as executor:
    # Submit tasks to the executor
    futures = [executor.submit(task, i) for i in range(20)]

    # Collect the results
    results = [future.result() for future in concurrent.futures.as_completed(futures)]

print(results)

# Copies the trainer code to the docker image.
COPY trainer /trainer
# Sets up the entry point to invoke the trainer.
ENTRYPOINT ["python", "-m", "trainer.task"]
