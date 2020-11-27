resource "aws_iam_user" "seondong_kim" {
  name = "seondong.kim"
}

resource "aws_iam_user_policy" "art_devops_black_for_seondong" {
  name = "super-admin"
  user = aws_iam_user.seondong_kim.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "*"
      ],
      "Resource": [
        "*"
      ]
    }
  ]
}
EOF

}
