resource "aws_instance" "name" {
  ami               = "ami-03cc2fdb1443ab619"
  instance_type     = "t3.micro"
  key_name          = "outputkeypair"
  availability_zone = "eu-north-1a"

  tags = {
    Name = "MyInstance_17-sep"
  }
}

# Both developers are managing the same AWS infrastructure,
# but they have different Terraform state files.

# Problems:
# 1. Dev 1 creates an EC2 instance.
# 2. Dev 2's state file does not know about Dev 1's EC2.
# 3. Dev 2 may create another EC2 instance.
# 4. Dev 1 changes something, but Dev 2 may not know about the change.
# 5. One developer may accidentally change or delete a resource
#    that is being used by the other developer.

# In one line:
# Different state files = different records of the same infrastructure
# = possible conflicts and duplicate resources.
#SOLUTION- MAINTAIN ONE STATE FILE FOR ALL DEVELOPERS TO USE.