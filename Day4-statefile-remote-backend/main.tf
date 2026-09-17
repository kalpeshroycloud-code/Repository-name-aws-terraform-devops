resource "aws_instance" "name" {
  ami               = "ami-03cc2fdb1443ab619"
  instance_type     = "t3.micro"
  key_name          = "outputkeypair"
  availability_zone = "eu-north-1a"

  tags = {
    Name = "MyInstance_17-sep"
  }
}
resource "aws_s3_bucket" "name" {
    bucket = "bucketthanksyouterraform" 
  
}




# Challenges When Multiple Developers Use the Same State File

# 1. Locking
# Only one developer should modify the state at a time.

# 2. Waiting
# Other developers may have to wait while the state is locked.

# 3. Concurrent Changes
# Two developers may try to change the same resource.

# 4. Accidental Changes
# One developer's change can affect another developer's work.

# 5. Accidental Deletion
# One developer may delete a resource another developer needs.

# 6. Coordination
# Developers need to communicate before making major changes.

# 7. State Corruption Risk
# Incorrect manual changes to the state can affect everyone.

# 8. Backend Dependency
# If the remote backend is unavailable, all developers may be affected.


#to overcome this we need to impliment state locking provision by using dynambo db