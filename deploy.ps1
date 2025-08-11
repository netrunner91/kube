# Skrypt do budowania i deploymentu aplikacji w Kubernetes

Write-Host "=== BUILDING DOCKER IMAGE ===" -ForegroundColor Green
docker build -t kubeapp:latest .

if ($LASTEXITCODE -ne 0) {
    Write-Host "Docker build failed!" -ForegroundColor Red
    exit 1
}

Write-Host "=== DEPLOYING TO KUBERNETES ===" -ForegroundColor Green
kubectl apply -f k8s/

Write-Host "=== CHECKING DEPLOYMENT STATUS ===" -ForegroundColor Green
kubectl get pods -l app=kubeapp
kubectl get services

Write-Host "=== APLIKACJA ZOSTALA WDROŻONA ===" -ForegroundColor Green
Write-Host "Sprawdź status: kubectl get pods" -ForegroundColor Yellow
Write-Host "Zobacz serwisy: kubectl get services" -ForegroundColor Yellow
Write-Host "Logi: kubectl logs -l app=kubeapp" -ForegroundColor Yellow
