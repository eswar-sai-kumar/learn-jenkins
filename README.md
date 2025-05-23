# Jenkins

- Create EC2 instance of t3.small → Open serveer in superputty 

```
sudo su -
```

```
cd /etc/yum.repos.d/
```

- Open the below link in browser and copy content

```
https://pkg.jenkins.io/redhat-stable/jenkins.repo
```

- Paste the content by vim editor, after that :wq!
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

- Open in browser and copy path
  
```
<public_ip>:8080
```

- Run command in superputty
  
```
cat <copied_path>
```
- Copy password and paste it in browser

- Continue → Install suggested plugins → give info → save and continue → save and finish → start using jenkins

- +New Item → item name (hello-jenkins) → Freestyleproject → Ok → Description → Build steps (Execute shell) → echo "Hello Jenkins" → save → Build now

- +New Item → item name (hello-pipeline) → select pipeline → Ok → Pipeline script ,dropdown button, select hello world → Build now

- +New Item → item name (hello pipeline from repo) → select pipeline → Ok → Pipeline (Pipeline script from scm) → SCM? Git → Repo url → Branch (*/main) → Jenkinsfile → save → apply

### Creating agents

- Manage jenkins → Nodes → New node → Name (agent-1) → Permanent agent → Number of executors (3) → Remote root directory (/home/ec2-user/jenkins-agent) → labels (agent-1) → Usage (only build jobs with label expressions matching the node) → launch method (launch agent via SSH) → Host (private_ip) → credentials (username:ec2-user, password:DevOps321, id: ssh-auth, description: ssh-auth) → choose ssh-auth → Host key verifiaction strategy (Non verifying verification startegy) → save

### When developer pushed the code to github, we need to trigger the pipeline

- Go to github → github repo → settings → webhook → add → payload url (http://<public_ip>:8080/github-webhook/) → content type(application/json) → select event (Just the push event) → add webhook

- Go to Jenkins → configure → github hook trigger → apply → save

