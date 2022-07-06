function buildDockerImage {
	param(
		[String]$tag
	)
	docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 -t eurobertics/php-devenv:$tag . --push
	docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 -t ghcr.io/eurobertics/php-devenv:$tag . --push
}

$dir = Get-ChildItem ${PWD} | ? { $_.PSIsContainer }
$dir | ForEach-Object { Set-Location $_.FullName; buildDockerImage($_.Name) }
Set-Location ../