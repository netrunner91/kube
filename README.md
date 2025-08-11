# Nauka Kubernetes - Przewodnik krok po kroku ♥

## Krok 1: Instalacja niezbędnych narzędzi

### 1.1 Docker Desktop
- Pobierz i zainstaluj Docker Desktop dla Windows z: https://www.docker.com/products/docker-desktop/
- Po instalacji uruchom Docker Desktop
- W ustawieniach włącz Kubernetes (Settings → Kubernetes → Enable Kubernetes)

### 1.2 kubectl (Kubernetes CLI)
Uruchom PowerShell jako Administrator i wykonaj:
```powershell
# Instalacja przez Chocolatey (jeśli masz)
choco install kubernetes-cli

# LUB instalacja przez winget
winget install Kubernetes.kubectl

# LUB pobierz ręcznie
curl -LO "https://dl.k8s.io/release/v1.28.0/bin/windows/amd64/kubectl.exe"
```

### 1.3 .NET SDK
Upewnij się, że masz zainstalowane .NET SDK (minimum 6.0):
```powershell
dotnet --version
```

### 1.4 Weryfikacja instalacji
```powershell
# Sprawdź Docker
docker --version

# Sprawdź kubectl
kubectl version --client

# Sprawdź połączenie z klastrem Kubernetes
kubectl cluster-info
```

# Nauka Kubernetes - Przewodnik krok po kroku

## ✅ Krok 1: UKOŃCZONY - Podstawowe środowisko działa!

Gratulacje! Masz działającą aplikację .NET w Kubernetesie lokalnie!

**Co masz teraz:**
- Aplikacja .NET Web API w kontenerze Docker
- 2 pody działające w Kubernetes
- Load Balancer rozdzielający ruch
- Health check endpoint
- Aplikacja dostępna pod: `http://localhost/health` i `http://localhost/weatherforecast`

## Krok 2: Poznawanie Kubernetes

### 2.1 Podstawowe koncepty które już używasz:
- **Pod** - najmniejsza jednostka w K8s (twój kontener)
- **Deployment** - zarządza podami i skalowaniem
- **Service** - udostępnia aplikację (LoadBalancer)
- **Namespace** - separacja zasobów (używasz 'default')

### 2.2 Przydatne komendy:
```bash
kubectl get pods              # Lista podów
kubectl get services          # Lista serwisów
kubectl logs -l app=kubeapp   # Logi aplikacji
kubectl scale deployment kubeapp-deployment --replicas=3  # Skalowanie
```

### 2.3 Pliki w projekcie:
- `KubeApp/` - kod aplikacji .NET
- `k8s/deployment.yaml` - definicja podów i kontenerów
- `k8s/service.yaml` - definicja serwisu (LoadBalancer)
- `deploy.ps1` - skrypt do budowania i wdrażania
- `cleanup.ps1` - skrypt do usuwania zasobów

## Krok 3: Następne kroki nauki

### 3.1 Lokalne eksperymenty:
- [ ] Zmień liczbę replik w `deployment.yaml`
- [ ] Dodaj nowy endpoint do aplikacji
- [ ] Spróbuj różnych typów serwisów (ClusterIP, NodePort)
- [ ] Dodaj ConfigMap i Secrets
- [ ] Dodaj Persistent Volume

### 3.2 Przygotowanie do Azure:
- [ ] Azure Container Registry (ACR)
- [ ] Azure Kubernetes Service (AKS)
- [ ] GitHub Actions CI/CD
- [ ] Ingress controllers
- [ ] SSL certificates

## Przydatne linki:
- [KUBERNETES_COMMANDS.md](KUBERNETES_COMMANDS.md) - wszystkie przydatne komendy
- [Kubernetes Documentation](https://kubernetes.io/docs/)
- [.NET on Kubernetes](https://docs.microsoft.com/en-us/dotnet/architecture/containerized-lifecycle/)

---
**Następny krok:** Eksperymenty lokalne lub przejście na Azure AKS
