---
layout: post
title:  "Герой мультфильма на SASS"
categories: css-notes 
image: /img/posts/krosh1.jpg
excerpt_separator: <!--more--> 
---

Попробуем воссоздать героя детского мультфильма "Смешарики" средствами CSS. Для начала подберем его изображение, на которое будем ориентироваться. Например, <a href="http://detkamonline.ru/media/icons/2/smeshariki_shkola_tanzev.jpg" target="_blank" rel="nofollow noopener">это</a>. С изображения можно брать цвета, и определить по нему основные блоки для создания фигуры.

<!--more-->

Создадим разметку: добавим внешний ограничивающий блок wrapper, блок объединяющий части тела персонажа .krosh, внутри которого добавим элементы для каждой части тела смешарика.

Так как мордочка зайца состоит из большого количества элементов, лучше всего добавить их внутрь общего блока .face.

{% highlight html linenos %}
<div class="wrapper">
<div class="krosh">
  <div class="body"></div>
  <div class="left-ear"></div>
  <div class="right-ear"></div>
  <div class="left-arm"></div>
  <div class="right-arm"></div>
  <div class="left-leg"></div>
  <div class="right-leg"></div>
  <div class="face">
    <div class="left-eye"></div>
    <div class="right-eye"></div>
    <div class="left-pupil"></div>
    <div class="right-pupil"></div>
    <div class="nose"></div>
    <div class="mouth">
      <div class="left-cheek"></div>
      <div class="right-cheek"></div>
      <div class="left-tooth"></div>
      <div class="right-tooth"></div>
    </div>
  </div>
</div>
</div>
{% endhighlight %}

<h2>Добавление стилей</h2>

Теперь добавляем стили. В примере используется Sass (SCSS). <a href="https://gist.github.com/trean/f00368fa7d8b0244ad5b071066148f63#file-crosh-scss" target="_blank" rel="noopener">Полный листинг с комментариями здесь</a>, а ниже опишу только наиболее интересные моменты.

Обозначим размеры полного изображения, добавим небольшой отступ над головой кролика, сделаем элемент круглым, чтобы смотрелся гармонично. градиент на фоне имитирует лужайку, тенюшка опять-таки для эстетики. 

{% highlight scss linenos %}
.wrapper {
    width: 270px;
    height: 250px;
    margin: 20px auto;
    padding-top: 20px;
    
    border-radius: 50%;
    background: linear-gradient(to top, #8bed8b 10%, #f9e0eb 80%);
    box-shadow: 8px 6px rgba(135, 232, 241,.2);
}

{% endhighlight %}

Добавим относительное позиционирование, чтобы можно было позиционировать внутри части тела, как нам удобно, обозначим размеры.

{% highlight scss linenos %}
.krosh {
    position: relative;

    width: 200px;
    height: 250px;
    margin: auto;
}
{% endhighlight %}

Этот и все остальные внутренние элементы позиционируются абсолютно внутри родительского элемента. Тело загораживает часть ушей и правой лапы, все оставшиеся части находятся поверх него. Таким образом понимаем, что в z-index нужно установить значение 2.

Добавим оформление: делаем тело круглым (с помощью border-radius: 50%), голубого цвета, с контуром, для объема добавляем тень - все берем с эталонной картинки. Чтобы сохранить "мультяшный" эффект, тень делаем не размытой.

{% highlight scss linenos %}
.body {
    position: absolute;
    z-index: 2;
    top: 100px;
    left: 30px;

    width: 130px;
    height: 130px;
    margin: auto;

    /* Оформление */

    border: 2px solid #0479b7;
    border-radius: 50%;
    background: #87e8f1;
    box-shadow: inset -8px -18px rgba(0, 0, 0, .05);
}
{% endhighlight %}

Уши - близки по форме к овалам. Берем обычные блоки, закругляем, но чтобы форма была более естественной, используем различные значения свойства border-radius для каждого угла и используем проценты. При помощи transform: rotate() немного наклоним ухо, установив координаты точки, относительно которой будет происходить вращение, с помощью свойства transform-origin.

{% highlight scss linenos %}
.left-ear {
    transform: rotate(-25deg);
    transform-origin: 50% 100%;
}
{% endhighlight %}

С правым ухом поступим аналогично, поменяв на обратный угол наклона (transform: rotate(25deg);) и отзеркалив border-radius (60% 100% 30% 100%).

С лапами все то же, что и с ушами, но их мы не поворачиваем, а наклоняем (transform: skew()). Правую лапку видно полностью, добавим ей z-index: 3.

Ноги - это сплющенные при помощи transform: scaleY() закругленные блоки. Их видно поверх тела, так что не забываем про z-index.

Переходим к формированию мордочки. Глаза находятся поверх элемента .mouth, следовательно z-index делаем равным 3. Глаза аналогичны другим элементам и отличаются только цветом. Немного повернем их, один сделаем немного больше. Добавим сверху (снова увеличиваем z-index) черные зрачки и розовый нос.

Щеки создаем из закругленных блоков, добавив border только снизу и либо справа, либо слева, в зависимости от того, с какой стороны элемент находится, а также наклоним их с помощью трансформации.

{% highlight scss linenos %}
.mouth {
    .left-cheek {
        transform: skew(-10deg);

        border-bottom: 2px solid #0479b7;
        border-left: 2px solid #0479b7;
        border-radius: 0 0 50% 40%;
    }
    .right-cheek {
        transform: skew(10deg);

        border-right: 2px solid #0479b7;
        border-bottom: 2px solid #0479b7;
        border-radius: 0 0 50% 40%;
    }
    .left-tooth {
        border-radius: 0 0 30% 50%;
        background: #fff;
    }
    .right-tooth {
        border-radius: 0 0 40% 30%;
        background: #fff;
    }
}
{% endhighlight %}

Получаем вот такую фигурку кролика Кроша. Пока без движения, но уже достаточно симпатичную.

<iframe width="100%" height="380" src="//jsfiddle.net/trean/ajur8s5t/6/embedded/result/" allowfullscreen="allowfullscreen" frameborder="0"></iframe><br>

<h2>Создание анимации</h2>
Теперь оживим Кроша. Для начала продумаем, как кролик будет двигаться: пусть он будет переступать с ноги на ногу, помахивать передними (верхними?) лапами, смотреть по сторонам и дергать ухом.

Для каждого из этих движений нам нужно написать <a href="http://www.w3schools.com/cssref/css3_pr_animation.asp" target="_blank" rell="nofollow noopener">анимацию</a>.

Kод анимации определяется с помощью правила <b>@keyframes</b>. Анимация создается путем постепенного перехода от одного набора стилей CSS к другому. За время анимации код стилей может меняться много раз. Каждое такое состояние объекта называется <b>ключевым кадром</b>. Момент, когда произойдет смена стилей определяется в процентах или с помощью ключевых слов "from" и "to", которые соответствуют значениям 0% и 100%. Для лучшей <a href="http://caniuse.com/#search=%40keyframe" target="_blank" rel="nofollow noopener">поддержки разными браузерами</a> нужно использовать вендорные префиксы, однако, в примере я этого делать не стану.

Синтаксис написания @keyframes:

{% highlight css linenos %}
@keyframes animationname {keyframes-selector {css-styles;}}
{% endhighlight %}

<table class="table">
<tr>
<th>Значение</th>
<th>Описание</th>
</tr>
<tr>
<td><i>animationname</i></td>
<td>Обязательное свойство. Объявляет имя анимации.</td>
</tr>
<tr>
<td><i>keyframes-selector</i></td>
<td>Обязательное свойство. Процент от продолжительности анимации.
<br><br>
<b>Допустимые значения:</b>
<ul>
<li>0-100%</li>
<li>from (то же, что и 0%)</li>
<li>to (то же, что и 100%)</li>
</ul>
<b>Замечание:</b> Вы можете иметь много ключевых кадров - селекторов в одной анимации .
</td>
</tr>
<tr>
<td><i>css-styles</i></td>
<td>Обязательное свойство. Одно или несколько css свойство.</td>
</tr>
</table>

Начнем с движения руками. Пусть кролик ими просто помахивает, для этого изменим угол поворота до 0 градусов на середине анимации. Нам понадобиться один ключевой кадр со значением 50%. Значения для начала (0% или from) и конца (100% или to) анимации вычислит браузер. Для повышения кроссбраузерности стоит добавить эти значения в @keyframes явно (в примере этого не делаю).

{% highlight scss linenos %}

@keyframes swing
{
    50%
    {
        transform: rotate(0deg);
    }
}

{% endhighlight %}

Движение ухом: сначала оно плавно немного опускается, а затем резко возвращается обратно, поэтому для движения вниз мы создадим несколько кадров, а для обратного движения просто запишем стили с исходным положением элемента в последний кадр анимации. Все это проделываем меняя градус поворота.

{% highlight scss linenos %}

@keyframes ear-swing
{
    0%
    {
        transform: rotate(-20deg);
    }
    10%
    {
        transform: rotate(-25deg);
    }
    12%
    {
        transform: rotate(-18deg);
    }
    100%
    {
        transform: rotate(-20deg);
    }
}

{% endhighlight %}

Зрачки смещаются то в одну сторону от своего обычного положения, то в другую.

{% highlight scss linenos %}

@keyframes pupil-ride
{
    40%
    {
        transform: translate(-3px);
    }
    60%
    {
        transform: translate(3px);
    }
}

{% endhighlight %}

Ноги постепенно смещаются по <i>x</i> и по <i>y</i> описывая дугу, для сохранения формы ноги добавляем scaleY(.5) в каждый кадр.

{% highlight scss linenos %}

@keyframes step-right
{
    0%
    {
        transform: translate(0, 0) scaleY(.5);
    }
    9%
    {
        transform: translate(5px, -6px) scaleY(.5);
    }
    14%
    {
        transform: translate(5px, 0) scaleY(.5);
    }
    69%
    {
        transform: translate(5px, 0) scaleY(.5);
    }
    79%
    {
        transform: translate(0, -6px) scaleY(.5);
    }
    84%
    {
        transform: translate(0, 0) scaleY(.5);
    }
}

{% endhighlight %}

Чтобы ноги шагали поочередно, во второй половине анимации изменим значения процентов. Это позволит переступать ногам не одновременно при втором шаге.

{% highlight scss linenos %}

@keyframes step-left
{
    0%
    {
        transform: translate(0, 0) scaleY(.5);
    }
    9%
    {
        transform: translate(5px, -6px) scaleY(.5);
    }
    14%
    {
        transform: translate(5px, 0) scaleY(.5);
    }
    50%
    {
        transform: translate(5px, 0) scaleY(.5);
    }
    55%
    {
        transform: translate(0, -6px) scaleY(.5);
    }
    60%
    {
        transform: translate(0, 0) scaleY(.5);
    }
}

{% endhighlight %}

Теперь, наконец, переносим все тело, так же по дуге, используя смещение по <i>x</i> и по <i>y</i>.

{% highlight scss linenos %}

@keyframes all-transition
{
    0%
    {
        transform: translate(0, 0);
    }
    10%
    {
        transform: translate(15px, -6px);
    }
    15%
    {
        transform: translate(15px, 0);
    }
    70%
    {
        transform: translate(15px, 0);
    }
    80%
    {
        transform: translate(0, -6px);
    }
    85%
    {
        transform: translate(0, 0);
    }
}

{% endhighlight %}


Свойство <b>animation</b> является обобщающим для восьми свойств анимации:
<ul>
    <li>animation-name</li>
    <li>animation-duration</li>
    <li>animation-timing-function</li>
    <li>animation-delay</li>
    <li>animation-iteration-count</li>
    <li>animation-direction</li>
    <li>animation-fill-mode</li>
    <li>animation-play-state</li>
</ul>

Синтаксис:

{% highlight css linenos %}
animation: name duration timing-function delay iteration-count direction fill-mode play-state;
{% endhighlight %}

<table class="table">
<tr>
<th>Значение</th>
<th>Описание</th>
</tr>
<tr>
<td><i>animation-name</i></td>
<td>Определяет имя правила @keyframes, который вы хотите связать с селектором.</td>
</tr>
<tr>
<td><i>animation-duration</i></td>
<td>Определяет, сколько <b>секунд или миллисекунд</b> анимации требуется для завершения. Например, 10s, 200ms и т.д. Также допустимыми значениями являются <b>initial</b> (т.е. значение по умолчанию) и <b>inherit</b> (т.е. значение наследуется от родителя).</td>
</tr>
<tr>
<td><i>animation-timing-function</i></td>
<td>Определяет <a href="http://htmlbook.ru/css/transition-timing-function" target="_blank" rel="nofollow noopener">кривую скорости анимации</a>. Вот наиболее часто встречающиеся.
    <ul>
        <li><b>ease</b> — анимация начинается медленно, разгоняется быстро и замедляется в конце (значение по умолчанию);</li>
        <li><b>linear</b> — ровное движение;</li>
        <li><b>ease-in</b> — плавно ускоряется к концу;</li>
        <li><b>ease-out</b> — ускоряется в начале;</li>
        <li><b>ease-in-out</b> — медленно начинается и медленно заканчивается, более плавное скольжение, чем ease</li>
        <li><b>cubic-bezier(x1, y1, x2, y2)</b> — позволяет вручную задать функцию плавности <a href="http://easings.net/ru" target="_blank" rel="nofollow noopener">через кривую Безье</a></li>
        </ul>
    </td>
</tr>
<tr>
<td><i>animation-delay</i></td>
<td>Задает задержку перед началом анимации в секундах (s) или милисекундах (ms). Также допустимыми значениями являются <b>initial</b> (т.е. устанавливается значение по умолчанию) и <b>inherit</b> (т.е. значение наследуется от родителя).</td>
</tr>
<tr>
<td><i>animation-iteration-count</i></td>
<td>Определяет , сколько раз нужно проиграть анимацию. Допустимые значения:
<ul>
    <li><b>целое число</b> - количество повторов, по умолчанию 1;</li>
    <li><b>infinite</b> - анимация повторяется бесконечно;</li>
    <li><b>initial</b> - устанавливает свойства в значение по умолчанию;</li>
    <li><b>inherit</b> - значение наследуется от родителя.</li>
</ul>
</td>
</tr>
<tr>
<td><i>animation-direction</i></td>
<td>Определяет , должна ли анимация проигрываться в обратном направлении. Допустимые значения:
<ul>
    <li><b>alternate</b> - проигрывается с начала до конца, а затем в обратном направлении;</li>
    <li><b>alternate-reverse</b> - проигрывается с конца до начала, а затем в обратном направлении;</li>
    <li><b>normal</b> - проигрывается с начала до конца, значение по умолчанию;</li>
    <li><b>reverse</b> - проигрывается в обратном направлении;</li>
    <li><b>initial</b> - устанавливает свойства в значение по умолчанию;</li>
    <li><b>inherit</b> - значение наследуется от родителя.</li>
</ul>
</td>
</tr>
<tr>
<td><i>animation-fill-mode</i></td>
<td>Определяет порядок применения определенных в @keyframes стилей к объекту. Допустимые значения:
<ul>
    <li><b>none</b> - состояние объекта не меняется, значение по умолчанию;</li>
    <li><b>forwards</b> - по окончанию анимации, сохраняется состояние, в котором объект находится на последнем кадре;</li>
    <li><b>backwards</b> - возвращает объект после загрузки страницы к состоянию, которое описано в первом кадре, даже если установлена задержка анимации, то объект удерживается в этом состоянии до начала анимации;</li>
    <li><b>both</b> - оставляет объект в первом ключевом кадре до начала анимации (игнорируя положительное значение задержки) и задерживает на последнем кадре до конца последней анимации.</li>
    <li><b>initial</b> - устанавливает свойства в значение по умолчанию;</li>
    <li><b>inherit</b> - значение наследуется от родителя.</li>
</ul>
</td>
</tr>
<tr>
<td><i>animation-play-state</i></td>
<td>Определяет, будет ли анимация проигрываться или приостановится. Допустимые значения:
<ul>
    <li><b>paused</b> - анимация приостановлена;</li>
    <li><b>running</b> - анимация проигрывается, значение по умолчанию;</li>
    <li><b>initial</b> - устанавливает свойства в значение по умолчанию;</li>
    <li><b>inherit</b> - значение наследуется от родителя.</li>
</ul>
</td>
</tr>
</table>

Добавим ранее созданную анимацию к элементам. Мы будем указывать только название анимации, ее длительность, количество повторов, функцию плавности и один раз задержку, чтобы Крош не начал шагать одновременно двумя ногами.

{% highlight scss linenos %}

.krosh {
    animation: all-transition 10s infinite linear;
    .left-ear {
        animation: ear-swing 5s infinite linear;
    }
    .left-arm {
        animation: swing 2s infinite linear;
    }
    .right-arm {
        animation: swing 2s infinite linear;
    }
    .left-leg {
        animation: step-left 10s infinite linear;
        animation-delay: 1s;
    }
    .right-leg {
        animation: step-right 10s infinite linear;
    }
    .face {
        .left-pupil {
            animation: pupil-ride 3s infinite linear;
        }
        .right-pupil {
            animation: pupil-ride 3s infinite linear;
        }
    }
}

{% endhighlight %}

Конечно, для каждой анимации пришлось подбирать значения, которые смотрелись бы наиболее удачно и естественно. Возможно, потребуется изменить некоторые значения в ключевых кадрах, и проверять каждый из них отдельно.

И, наконец, посмотрим на результат:

<iframe width="100%" height="380" src="//jsfiddle.net/trean/ajur8s5t/embedded/result/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>

