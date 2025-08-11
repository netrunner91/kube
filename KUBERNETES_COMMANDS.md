# Przydatne komendy Kubernetes

## Podstawowe komendy do monitorowania

```powershell
# Sprawdź status podów
kubectl get pods -l app=kubeapp

# Sprawdź serwisy
kubectl get services

# Sprawdź szczegóły deployment
kubectl describe deployment kubeapp-deployment

# Logi aplikacji
kubectl logs -l app=kubeapp --tail=20

# Logi z konkretnego poda
kubectl logs kubeapp-deployment-XXXXX

# Sprawdź eventy
kubectl get events --sort-by=.metadata.creationTimestamp
```

## Skalowanie aplikacji

```powershell
# Zwiększ liczbę podów do 3
kubectl scale deployment kubeapp-deployment --replicas=3

# Zmniejsz do 1
kubectl scale deployment kubeapp-deployment --replicas=1
```

## Testowanie aplikacji

```powershell
# Health check
curl http://localhost/health

# API pogodowe
curl http://localhost/weatherforecast
```

## Czyszczenie zasobów

```powershell
# Usuń wszystkie zasoby
kubectl delete -f k8s/

# LUB użyj skryptu
.\cleanup.ps1
```

## Łączenie się z podami (debugging)

```powershell
# Sprawdź nazwy podów
kubectl get pods -l app=kubeapp

# Połącz się z konkretnym podem (zamień XXXXX na prawdziwą nazwę)
kubectl exec -it kubeapp-deployment-XXXXX -- /bin/bash

# LUB jeśli bash nie działa, spróbuj sh
kubectl exec -it kubeapp-deployment-XXXXX -- /bin/sh

# Wykonaj jedną komendę bez interaktywnej sesji
kubectl exec kubeapp-deployment-XXXXX -- ls -la /app

# Skopiuj plik z poda na lokalny komputer
kubectl cp kubeapp-deployment-XXXXX:/app/appsettings.json ./downloaded-appsettings.json

# Skopiuj plik z lokalnego komputera do poda
kubectl cp ./local-file.txt kubeapp-deployment-XXXXX:/app/local-file.txt
```

## Przydatne komendy wewnątrz poda

```bash
# Po połączeniu się z podem możesz:
ls -la /app                    # Zobacz pliki aplikacji
cat /app/appsettings.json      # Przeczytaj konfigurację
ps aux                         # Zobacz procesy
env                           # Zobacz zmienne środowiskowe
curl http://localhost:8080/health  # Testuj aplikację lokalnie
```

## Zarządzanie kontekstami kubectl

```powershell
# Sprawdź aktualny kontekst
kubectl config current-context

# Zobacz wszystkie konteksty
kubectl config get-contexts

# Przełącz na lokalne Kubernetes (Docker Desktop)
kubectl config use-context docker-desktop

# Przełącz na Azure AKS
kubectl config use-context aks-kubeapp-demo

# Sprawdź gdzie jesteś (dodatkowa weryfikacja)
kubectl cluster-info
```

## Ponowne wdrożenie po zmianach w kodzie

```powershell
# 1. Zbuduj nowy obraz
docker build -t kubeapp:latest .

# 2. Wymuś ponowne uruchomienie podów
kubectl rollout restart deployment kubeapp-deployment

# LUB użyj skryptu deploy.ps1
.\deploy.ps1
```
