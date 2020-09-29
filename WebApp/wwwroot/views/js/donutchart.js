var tags = {};
var donutChartCanvas = $('#donutChart').get(0).getContext('2d')
var donutData = {
    labels: [],
    datasets: [{
        data: [],
        backgroundColor:[]
    }]
}

main = {
    setTagsSelectData: () => {
        tags = selector.getAllbyTags();
        console.log("tagTypes", tags);
        data1 = [];
        backgroundColor1 = [];
        $.map(tags,
            function (val, index) {
                donutData.labels.push(val.tagName);

                data1.push(val.count);
              //  backgroundColor1.push('#00c0ef');

            });
        backgroundColor1 = ['#f56954', '#00a65a', '#f39c12'];
        var datas = { data: data1, backgroundColor: backgroundColor1 };

        donutData.datasets.push(datas);

        console.log("donutdata", donutData);
       
    }
};

jQuery(document).ready(function () {
    main.setTagsSelectData();
    var donutOptions = {
        maintainAspectRatio: false,
        responsive: true,
    }
    //Create pie or douhnut chart
    // You can switch between pie and douhnut using the method below.
    var donutChart = new Chart(donutChartCanvas, {
        type: 'doughnut',
        data: donutData,
        options: donutOptions
    })
});


