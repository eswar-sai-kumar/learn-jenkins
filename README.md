# Jenkins

Create EC2 instance of t3.small → Open serveer in superputty 

```
sudo su -
```

```
cd /etc/yum.repos.d/
```

Open the below link in browser and copy content

```
https://pkg.jenkins.io/redhat-stable/jenkins.repo
```

Paste the content by vim editor, after that :wq!
```
vim jenkins.repo
```

```
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
```

```
yum install fontconfig java-21-openjdk -y
```

```
yum install jenkins -y
```

```
systemctl daemon-reload
```

```
systemctl enable jenkins
```

```
systemctl start jenkins
```
