resource "aws_launch_template" "this" {
  name_prefix   = "${var.name}-lt"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
}

resource "aws_autoscaling_group" "this" {

  name = "${var.name}-asg"

  desired_capacity = var.desired_capacity
  max_size         = var.max_size
  min_size         = var.min_size

  vpc_zone_identifier = var.subnet_ids

  target_group_arns = var.target_group_arns

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = var.name
    propagate_at_launch = true
  }

}