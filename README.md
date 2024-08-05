# CI/CD Süreci

## Projeye Genel Bakış

Bu projede, Visual Studio, Azure DevOps, VMware Ubuntu (self agent), VMware Ubuntu (Kubernetes), Lens (Kubernetes izlemek için) ve Docker Registry kullanarak bir CI/CD süreci oluşturdum. Bu süreç, HTML tabanlı bir web uygulamasının geliştirilmesi, test edilmesi, Docker imajı olarak paketlenmesi ve Kubernetes üzerinde dağıtılmasını otomatikleştirir.

## Kullanılan Teknolojiler ve Araçlar

Visual Studio: Kod geliştirme ve sürüm kontrolü için kullandım.

Azure DevOps: CI/CD süreçlerini yönetmek için kullandım.

VMware Ubuntu (self agent): Azure DevOps pipeline'larını çalıştırmak için self-hosted agent olarak kullandım.

VMware Ubuntu (Kubernetes): Kubernetes cluster'ını çalıştırmak ve uygulamaları dağıtmak için kullandım.

Lens: Kubernetes cluster'ını izlemek ve yönetmek için kullandım.

Docker Registry: Docker imajlarını depolamak için kullandım.

## Adım Adım Süreç


### 1. Kod Geliştirme

Visual Studio ile HTML projesini geliştiriyorum. Kodum tamamlandığında, değişiklikleri Git ile sürüm kontrolüne alıyorum ve Azure Repos'a push ediyorum.


![azurerepos](https://github.com/user-attachments/assets/f53a1b6d-dbe6-4a6d-a58d-c4758d04e3cd)


### 2. Dockerfile Oluşturma

Proje dizininde bir Dockerfile oluşturuyorum ve HTML projesinin nasıl paketleneceğini tanımlıyorum. 


![azuredevops-dockerfile-added](https://github.com/user-attachments/assets/3ba2e0ed-8b0f-4d24-9599-25623c05fd6e)


### 3. Docker Hub Hesabını Azure DevOps'a Eklemek

Azure DevOps portalına gidip Project Settings > Service connections sekmesinden yeni bir Docker Hub service connection oluşturuyorum.

Docker Hub kullanıcı adı ve erişim token'ını girerek bağlantıyı oluşturuyorum.


![dockerserviseadded](https://github.com/user-attachments/assets/072a0225-df47-4edf-9513-6a11ce93f754)


### 4. Self-Hosted Agent Kurulumu

VMware Ubuntu üzerinde Azure DevOps self-hosted agent'ı kuruyorum.

Azure DevOps portalına gidip Organization Settings > Agent pools sekmesinden yeni bir self-hosted agent oluşturuyorum.

Agent konfigürasyon talimatlarını izleyerek agent'ı indiriyorum ve kuruyorum:



![selfagent](https://github.com/user-attachments/assets/ec68d0de-9117-41df-9c71-46b389728adb)


### 5. Pipeline Oluşturma ve Docker İmajını Oluşturma ve Push Etme

Docker Hub hesabımda projeye ait repository oluşturuyorum:


![dockerrregistry-repooluşturdum](https://github.com/user-attachments/assets/c9306dcb-0570-44b0-8553-ac9b55c84d68)



Azure DevOps'ta yeni bir pipeline oluşturuyorum ve kod deposu olarak Azure Repos'u seçiyorum.

YAML tabanlı bir pipeline yapılandırması oluşturuyorum:



![pipeline(image build-push)](https://github.com/user-attachments/assets/ee46b3a0-10e8-410e-a782-047c81d5fcd1)


Pipeline çalıştırıyorum:


![pipeline calısıyor](https://github.com/user-attachments/assets/07a757c1-c6e8-4175-8085-18ce8da9661b)



Artık pipeline sayesinde byzmb/cryptop-html repositoryde image build tagı ile birlikte yer alıyor:



![dockerimage-dockerregistry](https://github.com/user-attachments/assets/0676c6a0-c826-4226-aae3-6445a898143d)



### 6. Kubernetes Üzerinde Deployment ve Servis Oluşturma

VMware Ubuntu üzerinde bir Kubernetes cluster oluşturuyorum.


![k8s nodes](https://github.com/user-attachments/assets/c2c6c904-0866-4b06-8a41-f16d5f08fa65)



Kubernetes cluster'ına erişimi sağlamak için kubectl konfigürasyon dosyasını ayarlıyorum.

Docker imajını kullanarak Kubernetes cluster'ına deploy etmek için gerekli Deployment ve Service YAML dosyalarını oluşturuyorum:

Deployment yaml dosyası:


![nanodeploymnetoluştur](https://github.com/user-attachments/assets/b153a1b1-8f08-49e9-b553-97dfc55cc7d1)


Service yaml dosyası:


![nanoservice create](https://github.com/user-attachments/assets/520f7ef5-8ade-45dd-a28f-4fa31675688f)


### 7. İzleme ve Yönetim

Lens uygulamasını kullanarak Kubernetes cluster'ımı izliyorum. Lens, cluster içerisindeki pod'ların, servislerin, deployment'ların ve diğer kaynakların durumunu görsel olarak takip etmemi sağlıyor.


![lensdeployment](https://github.com/user-attachments/assets/22a6a596-2940-403d-b444-14e6c9c55f7f)


![lens service](https://github.com/user-attachments/assets/581d89fa-1043-45ef-841a-e257ff88d648)


Artık html projemiz localde ayaga kaldırmak için hazır:


![siteyayında](https://github.com/user-attachments/assets/77c8961c-c7ce-4b1f-982e-c36c73c57f7a)



## Sonuç

Bu README dosyasında, Visual Studio, Azure DevOps, VMware Ubuntu (self-hosted agent ve Kubernetes), Docker Hub ve Lens kullanarak HTML tabanlı bir web uygulaması için oluşturduğum CI/CD sürecinin adımlarını detaylı bir şekilde paylaştım. Bu süreç, kod geliştirme, Docker imajlarını oluşturma, Kubernetes cluster'ına deploy etme ve izleme adımlarını içerir. Bu otomatikleştirilmiş CI/CD süreci sayesinde, yazılım teslimatlarımız daha hızlı, güvenilir ve hatasız hale gelmiştir. Ayrıca, Lens ile Kubernetes cluster'ımızı etkin bir şekilde izleyerek, herhangi bir sorun durumunda hızlı müdahale edebilme yeteneği kazanmış olduk. Bu süreç, yazılım geliştirme ve dağıtım döngülerimizi optimize ederek, projelerimizin kalitesini ve sürdürülebilirliğini artırmıştır.
