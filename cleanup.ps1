# Skrypt do czyszczenia zasobów Kubernetes

Write-Host "=== USUWANIE ZASOBÓW KUBERNETES ===" -ForegroundColor Red
kubectl delete -f k8s/

Write-Host "=== SPRAWDZANIE CZY WSZYSTKO USUNIĘTE ===" -ForegroundColor Yellow
kubectl get pods -l app=kubeapp
kubectl get services

Write-Host "=== ZASOBY ZOSTAŁY USUNIĘTE ===" -ForegroundColor Green
