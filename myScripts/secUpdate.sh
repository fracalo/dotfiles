
SecurityGroupRuleId=''
GroupId=''
port=''

ip=($(curl https://httpbin.org/ip | jq '.origin' | tr -d '"'))


cidr=$ip/32

echo cidr is $cidr

aws ec2 authorize-security-group-ingress  \
  --group-id $GroupId  \
  --protocol tcp --port $port --cidr $cidr

#aws ec2 modify-security-group-rules  \
#  --group-id $GroupId --security-group-rules \
#  SecurityGroupRuleId=$SecurityGroupRuleId,SecurityGroupRule={IpProtocol=tcp,CidrIpv4=$cidr}

