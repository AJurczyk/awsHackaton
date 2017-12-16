resource "aws_ecs_task_definition" "ngnix" {
  family = "ngnix"

  container_definitions = <<DEFINITION
[
  {
    "cpu": 128,
    "environment": [{
      "name": "SECRET",
      "value": "KEY"
    }],
    "essential": true,
    "image": "111669918511.dkr.ecr.eu-central-1.amazonaws.com/hackaton",
    "memory": 128,
    "memoryReservation": 64,
    "name": "ngnix"
  }
]
DEFINITION
}

resource "aws_ecs_service" "ngnix" {
  name          = "ngnix"
  cluster       = "${aws_ecs_cluster.ecs-cluster.id}"
  desired_count = 2
  task_definition = "${aws_ecs_task_definition.ngnix.arn}"
}
