prefix="test"
project="demo"
environment="local"
region_code="aspe2"
cluster_version="1.27"

node_desired_size=3
node_min_size=2
node_max_size=5
instance_type="m5.xlarge"
volume_size="32"
volume_type="gp3"
iops="3000"
throughput="125"
capacity_type="SPOT"
addition_sg_node=[]
iam_administrators_list=[]
whitelist_ips=["10.0.0.0"]

