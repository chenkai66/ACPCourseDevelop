## 🚄 Preface

Hands-on practice is an essential part of learning large language models (LLMs). To help you better grasp the relevant knowledge, this course includes a variety of sample code.

We recommend that you study the course via [DSW](https://help.aliyun.com/zh/pai/user-guide/dsw-overview) on Alibaba Cloud's Artificial Intelligence Platform PAI. With PAI DSW, you can run the code while reading the course documentation, as shown in the image below, to better understand and apply LLMs.

<img src="https://img.alicdn.com/imgextra/i4/O1CN01jh8Sp41NNc4S3fp4u_!!6000000001558-1-tps-512-176.gif" alt="PAI DSW Notebook Demo" width="500px">

## Getting Started

### Video Tutorial
<video width="960" height="540" controls playbackRate="1.2">
    <source src="https://cloud.video.taobao.com/vod/lWmQQxay0s-puVoWV5rdJy7Rm3hwLvQXN797pj87LeY.mp4" type="video/mp4">
</video>

> Note: This video tutorial is based on the following text and image tutorial. [【If the demo video cannot play properly, click here】](https://cloud.video.taobao.com/vod/lWmQQxay0s-puVoWV5rdJy7Rm3hwLvQXN797pj87LeY.mp4)

### Text and Image Tutorial
The following steps will guide you to prepare your online learning environment using PAI DSW.

### Step One: Create a PAI DSW Instance

**Free Trial**: If you are a new user of PAI DSW, you can claim free trial credits through [Alibaba Cloud’s Free Trial Channel](https://free.aliyun.com/?searchKey=%E4%BA%A4%E4%BA%92%E5%BC%8F%E5%BB%BA%E6%A8%A1+PAI-DSW). For three months after claiming the free trial, you can use up to 250 compute hours per month of CPU/GPU instances for free, which is approximately 430 hours of ecs.g6.xlarge CPU instances or about 35 hours of ecs.gn7i-c8g1.2xlarge GPU instances per month.

<img src="https://scms-prod-sh-public.oss-cn-shanghai.aliyuncs.com/course_picture/eswmhiaayvhezjzedlrf.png" width="260px" alt="Free Trial">

If you do not have any free trial credits, you can create an instance as follows:
1. Go to the [PAI Console](https://pai.console.aliyun.com/?regionId=cn-hangzhou#/workspace/overview).
   
2. If you have not activated the PAI platform service, follow the instructions to activate PAI and create the default workspace by clicking **Confirm Activation and Create Default Workspace**. After activation is complete, click **Go to Default Workspace**.
   
    <img src="https://img.alicdn.com/imgextra/i4/O1CN01SxUAgU1GEj4jiwFYW_!!6000000000591-0-tps-2430-1736.jpg" width="600px">

3. Click **Data Science Workshop** on the left sidebar, then click **Create New Instance**.

    <img src="https://img.alicdn.com/imgextra/i2/O1CN01CrbZLb1OEk0wgkBQe_!!6000000001674-0-tps-846-1076.jpg" width="300px">

4. On the Create New Instance page, fill in the instance name, select the resource specifications, and choose the image:

  * **Instance Name**: You can enter **aliyun_acp_learning** or another name that is easy to remember and find.
  
  * **Resource Specifications**: It is recommended to select **ecs.g6.xlarge** from the **Free Trial Tab**.

      <img src="https://img.alicdn.com/imgextra/i4/O1CN01eRCLAY1rPO7SxGEfr_!!6000000005623-0-tps-1434-772.jpg" width="500px">

      > It is recommended to choose a CPU instance, as this specification is sufficient to run most projects in this course. You can create GPU instances when needed in later chapters to reduce free credit consumption.
  
  * **Image**: In this example, you need to choose a `CPU type` image. We recommend using an image with Python version 3.10 for easier subsequent configuration. You can filter the latest images that meet the criteria in the following way (e.g., modelscope:1.23.1-pytorch2.3.1-cpu-py310-ubuntu22.04).

      <img src="https://img.alicdn.com/imgextra/i2/O1CN01ZVCibE1es9zqe9BPv_!!6000000003926-0-tps-1886-1240.jpg" width="800px">

5. Keep other settings as default, click **OK**, and the instance creation will be completed, typically within no more than 5 minutes.

    <img src="https://img.alicdn.com/imgextra/i3/O1CN013NKRsk1EFyyI9Sw3C_!!6000000000323-0-tps-1852-962.jpg" width="600px">

6. When the instance status shows as running, click **Open** in the **Operation** column to access the online Notebook interface provided by DSW.

    <img src="https://img.alicdn.com/imgextra/i2/O1CN01S61kqY29kbYF456Pq_!!6000000008106-0-tps-1916-596.jpg" width="600px">

    > DSW deducts or charges based on instance runtime. It is recommended to stop the instance when not in use to save credits.

    > If you do not have any free credits, you can try completing this tutorial using [ModelScope’s Notebook feature](https://modelscope.cn/my/mynotebook).


### Step Two: Obtain Course Code and Install Dependency Environment

In DSW, you can access the command-line environment by clicking Terminal at the top.

Verify the environment variables. In the Terminal, input `python --version` to confirm that the current Python version is 3.10, and input `pwd` to confirm that the current directory is <mark>/mnt/workspace</mark>.  



```bash
python --version
pwd
```

<img src="https://img.alicdn.com/imgextra/i4/O1CN01wPwQH11shzpMyeyDb_!!6000000005799-0-tps-1718-384.jpg" width="600px">

If you are not in the **/mnt/workspace** directory, enter the following command to ensure smooth installation afterward:  



```bash
cd /mnt/workspace
```

Next, you can complete the **environment setup** and **download the course files** required for the course through either **automatic or manual** methods.

#### 1. Automatic Installation
Execute the following command in the DSW Terminal to download a script that automatically installs the environment dependencies required for the course.



```bash
wget https://developer-labfileapp.oss-cn-hangzhou.aliyuncs.com/ACP/aliyun_llm_acp_install.sh
/bin/bash aliyun_llm_acp_install.sh
```

<img src="https://img.alicdn.com/imgextra/i3/O1CN01xyuBfZ1ps7jnlsDal_!!6000000005415-2-tps-2388-1076.png" width="800px">

If this step executes successfully, you can skip the following manual installation steps.

#### 2. Manual Installation

##### 2.1 Download Course Code

Enter the following command in the `Terminal` to obtain the code for the ACP course:  



```bash
git clone https://github.com/AlibabaCloudDocs/aliyun_acp_learning.git
```

> If you encounter network issues, you can also obtain it from atomgit: `git clone https://atomgit.com/alibabaclouddocs/aliyun_acp_learning.git`

> If you are familiar with Jupyter Notebook and wish to run it locally, we recommend using a Python 3.10 environment.

##### 2.2 Install Dependencies Manually

Continue running the following commands sequentially in the `Terminal` to install the required dependencies for this course:  



```shell
# Create a Python virtual environment named llm_learn using the venv module
python3 -m venv llm_learn

# Activate the llm_learn virtual environment
source llm_learn/bin/activate

# Upgrade pip within the virtual environment
pip install --upgrade pip

# Install the ipykernel kernel management tool
pip install ipykernel

# Add llm_learn to ipykernel
python -m ipykernel install --user --name llm_learn --display-name "Python (llm_learn)"

# Install dependencies for code execution in the llm_learn environment
pip install -r ./aliyun_acp_learning/requirements.txt

# Deactivate the llm_learn virtual environment
deactivate
```

#### 3. Switching Python Environments

After completing the installation steps, switch to Notebook at the top, and you will be able to see the aliyun_acp_learning folder in the file tree.

<img src="https://img.alicdn.com/imgextra/i3/O1CN01w44E5Q1P94lxtv9Bo_!!6000000001797-0-tps-1682-486.jpg" width="600px">

Next, you can sequentially enter the aliyun_acp_learning-Large Language Model (LLM) ACP Certification Tutorial-**p2_Building a Large Language Model Q&A System** folder in the file tree to view the content of the next chapter's tutorial.

<img src="https://img.alicdn.com/imgextra/i2/O1CN01Rn6o0s22cAwy3QqTr_!!6000000007140-0-tps-978-1408.jpg" width="320px">

After the course content is installed, you still need to **select the kernel** (default kernel: Python 3 (ipykernel)) in the upper right corner of the Notebook course (.ipynb file), and switch to the Python environment you just created. For example, the `Python(llm_learn)` environment created above.<br>
<img src="https://img.alicdn.com/imgextra/i2/O1CN01taOhij1R2KAIVQcts_!!6000000002053-0-tps-2962-976.jpg" width="800px"><br>
<img src="https://img.alicdn.com/imgextra/i3/O1CN01bUaGH01bC4kupRQWN_!!6000000003428-0-tps-778-632.jpg" width="320px"><br>
<img src="https://img.alicdn.com/imgextra/i1/O1CN01RUqHeu1CoDLI7526r_!!6000000000127-0-tps-780-344.jpg" width="320px"><br>

> Typically, you need to manually specify the Python environment for each courseware. There are many versions of Python, and different projects use different component versions. The venv virtual environment used in this course can create an independent Python environment for each project, avoiding version conflicts and simplifying dependency management.

Once you have successfully completed the steps above, you can begin learning the course. Wishing you a smooth journey ahead in your studies!<br>


## Extended Reading
For convenient reading, you can access the guide interface of the current document through the left-hand menu:

<img src="https://img.alicdn.com/imgextra/i1/O1CN01Ep5AcP1Z7NSeB2ztS_!!6000000003147-0-tps-1960-980.jpg" alt="Guide" width="600px">

If you are not accustomed to the dark theme, you can also adjust it in the Settings menu at the top:

<img src="https://img.alicdn.com/imgextra/i4/O1CN01E7kH2F1fBqzPMkkoZ_!!6000000003969-2-tps-961-279.png" alt="Settings" width="600px">

### Common Issues with DSW

Q1: Why is the position of the input box for interaction different between WebIDE and Notebook in DSW?

A1: In tutorial 2.1, you will input an API Key. If you use Notebook, the input box will be very easy to find (just below the code block that runs).

<img src="https://img.alicdn.com/imgextra/i1/O1CN01bNeIzG1PJ9SjOilw7_!!6000000001819-0-tps-1642-286.jpg" width="500px" alt="Switch Kernel">

If you use WebIDE, the input box will appear directly above the code file.

<img src="https://img.alicdn.com/imgextra/i2/O1CN01horPgp1foKH3nnLW8_!!6000000004053-0-tps-1660-604.jpg" width="500px" alt="Switch Kernel">

Q2: In Notebook, I can see images directly, but why does the image disappear after double-clicking the Markdown block where the image resides?

A2: This happens because double-clicking the Markdown block enters edit mode. Simply click on any code block outside the Markdown block to return to view mode, and the image will reappear.

<img src="https://img.alicdn.com/imgextra/i4/O1CN012mnKlz1Q5hRev3onD_!!6000000001925-1-tps-1240-372.gif" width="500px" alt="Switch Kernel">

Q3: I noticed that there are updates in the Git repository. How do I pull the latest code?

A3: You can run the following two commands sequentially in the Terminal:

```shell
git checkout .
git pull
```

Note: This action will overwrite the local code. If you need to keep the local runtime results, please back up before proceeding.

Q4: When I execute the `git clone` command, the speed is very slow, and it reports a timeout error. What should I do?

A4: You can stop the instance, switch to another region, and then create a new instance to pull the code.

<img src="https://img.alicdn.com/imgextra/i2/O1CN01BSl0Ku1Hef8xRAm9Q_!!6000000000783-0-tps-958-1112.jpg" width="300px" alt="Switch region">  

