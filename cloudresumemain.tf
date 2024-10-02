resource "aws_lambda_function" "myfunc" {

  filename      = "lambda_function_payload.zip"
  function_name = "myfunc"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "func.handler"

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "python 3.12"
}

data "archive_file" "zip" {
  type        = "zip"
  source_dir = "${path.module}/lambda/"
  output_path = "${path.module}/packedlambda.zip"
}



resource "aws_iam_role" "iam_for_dade" {
  name = "iam_for_dade"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}