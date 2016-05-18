Для начала создадим разметку:
добавим внешний ограничивающий блок wrapper, блок объединяющий части тела персонажа krosh, внутри которого добавим элементы для каждой части тела смешарика.

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
</div>
</div>
{% endhighlight %}

Так как мордочка зайца состоит из большого количества элементов, лучше всего добавить их внутрь общего блока face, 
т.к. при дальнейшей анимации это позвлит проще манипулировать ей.То же касается и рта, к которому отнесем щеки и зубы.
Добавим оставшиеся детали:

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
    <!-- Добавим детали мрдочки Кроша --> 
    <div class="left-eye"></div>
    <div class="right-eye"></div>
    <div class="left-pupil"></div>
    <div class="right-pupil"></div>
    <div class="nose"></div>
    <div class="mouth">
      <!-- Рот и сопутствующие элементы так же объединим общим родителем -->
      <div class="left-cheek"></div>
      <div class="right-cheek"></div>
      <div class="left-tooth"></div>
      <div class="right-tooth"></div>
    </div>
  </div>
</div>
</div>
{% endhighlight %}

Теперь начинается самое интересное: добавляем стили. Так как от чистого CSS я уже отвыкла, 
и писать на нем без препроцессоров уже кается неким подвидом мазохизма, будем использовать SASS.
Для начала зададим размеры и отступы wrapper'а и нашего героя. Так как остальные элементы придется позиционировать абсолютно относительно этого
блока, н забываем добавит строчку position: relative;

{% highlight sass linenos %}
.wrapper
{
    width: 270px;
    height: 250px;
    // позиционируем блок по центру страницы, 
    и даем отступы сверху и снизу по 20px
    margin: 20px auto;
 .krosh
    {
        position: relative;

        width: 200px;
        height: 250px;
        margin: auto;
}
{% endhighlight %}




<script async src="//jsfiddle.net/trean/07sgwqgq/embed/"></script>
