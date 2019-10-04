## Deecamp 2019 23组

###### 随手涂鸦变为卡通画

这里放上我在团队中参与的部分，由于一开始没打算放上来，所以也没怎么整理非常散乱，其他的前后端、CartoonGan的部分没有放上来

雁栖湖之行是蛮愉快的

### 主要工作

主要是利用MATLAB进行预处理(做数据集，以及对生成图像进行再加工)，基于Pix2PixGan的修改等等

##### 数据集的制作

没有数据集，想找到大量配对的简笔画和卡通画太难。只能先找卡通画，作为训练集生成图像的Ground Truth，再通过其他办法生成对应的简笔画

- `人工画`，画了一些，效果不好，应该需要大量，没有时间和人手，仅保留少量
- `基于GAN的边缘提取`，效果不错，唯一的问题是原画的粗边缘容易提出双轮廓（用户手绘没有双轮廓，这种数据集训练出来的网络效果不太好）
- `传统算法的边缘提取`，非常精细，尤其是canny算子的效果非常好，同样的粗边容易提出双轮廓（现在学了数字图像处理，觉得可以用二阶微分处理一下）
- `转化成黑白二值图`，感觉针对卡通画来说，是效果最好的一个，一方面粗边没有双轮廓，另一方面保留了一些色块，有的用户画图时就会把眼睛涂黑等等，更贴近真实输入。当然选的再好的阈值也对一些图不起作用，拎出来单独处理

为了贴近用户输入，我们还做了一些其他的处理

- `膨胀腐蚀`，这让边框粗细不均，一些闭合边缘也能被破坏，在某些图上也能消除双轮廓的问题
- `图像扭曲`，让边缘更抖，贴近真实输入

最终我们根据不同的训练阶段，选用了不用的方法制作数据集，最后大概有几千张



##### GAN网络训练的问题及相应改进措施

在利用Pix2Pix网络生成卡通画时，数据集的规模极大限制了最终的效果，训练不充分导致了下面的问题（这已经是后期比较好的情况）

![train_problem](http://github.com/congee524/Deecamp2019-23-group/raw/master/notes_image/train_problem.png)


因为数据集比较少，必须要强迫网络在一次训练中学到更多东西，那就要让生成图像和真图的差距Loss的大小更重要一点。所以在生成器的损失函数中，我们又增加了原图和假图在判别器中下采样一次之后的图像的L1 loss，这样对fake picture和ground truth的相似度又增加了一层，能让网络学的更快。

一开始是打算原图经过一次传统意义上的下采样（缩小），再和假图经过判别器一次下采样之后的图做L1 loss的计算，但是发现跨幅太大，也学不起来，还是让原图经过判别器的下采样，修改之后的gen_loss计算公式：

![gen_loss_function](\notes_image\gen_loss_function.png)

公式这里是经过k次下采样，每次都计算一次，但实际训练中发现效果是差不多的，就取了经过一次下采样之后的L1 loss加上去

这次出来的测试效果就好多了（基础图是Pix2Pix网络的结果，后面是其它队友用CartoonGan做的）：

![test_picture](
http://github.com/congee524/Deecamp2019-23-group/raw/master/notes_image/test_picture.jpg)



##### 模型训练过程

前期的经验不足，让我们不得不调整模型训练的方法

我们前期犯的最大错误是数据集制作方向有问题，因为觉得同样画风的数据集训练起来比较容易，我们收集了几千种同种画风的数据集（几百张同样的猪，几百张同样的猫等等），因为这些图像实在长得太像（轮廓几乎是一样的，就是面部表情有一些细微的差距），导致GAN网络很难通过图片的某些细节学会如何填充细节。结果就是训练出来的网络对输入有严苛的要求，只要和训练集稍有差距，就没法生成看得过去的图

等我们纠正错误的时候，时间已经很紧张，所以我们直接将原来在这些相似画风数据集上训练的模型拿来在新的数据集上训练，一边做数据集，一边训练，每批次小几百张放进去

最开始的模型，建立在相似画风数据集上，对一些细节的填充有了大概的把握

随后我们用canny算子做了很多数据集，传统方法制作的数据集卡通画和简笔画完全对应，网络迁移过来比较好学习

随后又用了PhotoSketch网络做了很多数据集，这样得到的简笔画是GAN生成的假图，不再完全对应，贴近用户输入，再加上一些经过膨胀腐蚀、图像扭曲的canny算子提取出来的图一起训练，这阶段的网络在细节生成上有了更多的变化

最后我们注意到用户输入的色块问题（之前生成的简笔画都是线条，而用户画画的时候可能会把某些部位涂黑，结果生成的时候效果很差），开始通过黑白二值图转化制作大量数据集，同样做了一些后处理，这阶段的网络差不多能让用户得到较好体验了

我们用于训练的图片在此过程中，从一百多张逐步增加到几千张

`此处感谢组委会给我们提供了5张显卡，不然真的来不及多次尝试修改网络`



### 最终效果

在`/test/index4.html`中可以看到最后的测试效果

`user_pic`中是用户测试的图片，这是一些展示：

![psb (1)](
http://github.com/congee524/Deecamp2019-23-group/raw/master/user_picture/psb (1).jpg)

![psb (3)](
http://github.com/congee524/Deecamp2019-23-group/raw/master/user_picture/psb (3).jpg)

![psb (4)](
http://github.com/congee524/Deecamp2019-23-group/raw/master/user_picture/psb (4).jpg)

![psb (6)](
http://github.com/congee524/Deecamp2019-23-group/raw/master/user_picture/psb (6).jpg)
