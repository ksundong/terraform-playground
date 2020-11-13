# 간단하게 테라폼 사용하기

## 왜 테라폼인가?

테라폼은 IaC의 준표준 도구로 인프라를 안전하고 효율적으로 구축, 변경 및 버전 관리하기 위한 도구입니다.

테라폼은 유명한 Cloud 서비스 및 온프레미스 환경에도 적용할 수 있습니다.

테라폼의 설정 파일은 인프라를 구성하는데 필요한 요소들을 설정합니다.

테라폼이 관리할 수 있는 인프라는 컴퓨팅 인스턴스, 스토리지, 네트워킹 같은 하위 수준 구성요소와 DNS 항목 SaaS 기능같은 상위 수준 구성요소를 포함합니다.

## 튜토리얼 따라하면서 사용해봅시다.

AWS를 사용합니다.

수동으로 설치할 수도 있지만 패키지 매니저를 사용합시다.

MacOS니까 Homebrew를 사용했습니다.

`brew install terraform`

설치가 완료되었다면 다음과 같이 확인합니다.

`terraform -help`

bash 혹은 zsh는 terraform 커맨드 자동완성이 안 될 수 있습니다.

`terraform -install-autocomplete`

이를 입력하고 shell을 재시작하면 자동완성이 됩니다.(탭 눌러서 자동완성하는 것)

### 로컬 도커에다가 해보기

생략

### AWS 설정하기

aws cli를 설치해야합니다.

`aws configure` 로 설정합니다.

### AWS EC2 인스턴스 생성하기

`mkdir learn-terraform-aws-instance`

`cd learn-terraform-aws-instance`

`touch example.tf`

> 테라폼애 사용하는 파일의 확장자는 `tf` 입니다.
>
> VSCode의 자동완성은 구린편입니다.

```terraform
provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
}
```

aws를 알면 무슨일을 하는지 대충 아실 수 있습니다.

> 0.12버전 이후를 사용한다면 테라폼 블록을 제거할 수 있습니다.
>
> ```
> terraform {
>   required_providers {
>     aws = {
>       source  = "hashicorp/aws"
>       version = "~> 2.70"
>     }
>   }
> }
> 
> ```
>
> 원래 이걸 맨 위에 적어주는데 필요없습니다.

`terraform init`

디렉토리를 초기화합니다.

`terraform fmt`

테라폼 설정을 초기화합니다.

`terraform validate`

설정을 검증합니다. 유효하면 유효하다는 메시지가 나옵니다.

> terraform 0.11 버전까지는 `terraform plan` 을 해줘야 `terraform apply` 를 할 수 있습니다.

`terraform apply`

실제로 인프라를 배포하기 위한 명령어입니다.

입력하고 뭐라고 주르륵 나오고 정말 할건지 여부를 묻습니다.

yes를 입력하면 진행됩니다.

`terraform show`

배포된 인프라의 상태를 보여줍니다.

`terraform destroy`

배포된 인프라를 제거하는 명령어입니다.

