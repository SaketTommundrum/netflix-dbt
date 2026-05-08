import boto3
from boto3.s3.transfer import TransferConfig
import urllib3

# Suppress SSL warning since verify=False
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

s3 = boto3.client('s3', region_name='us-east-2', verify=False)

config = TransferConfig(
    multipart_threshold=1024 * 1024 * 25,   # 25MB (must be in bytes)
    max_concurrency=2,
    multipart_chunksize=1024 * 1024 * 25,   # 25MB (must be in bytes)
    use_threads=True
)

s3.upload_file(
    r"C:\Users\Saket Tommundrum\Downloads\ml-20m\ratings.csv",
    'netflixdataset-saket',
    'ratings.csv',
    Config=config
)
print("Upload successful!")