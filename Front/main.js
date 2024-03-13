function displayDateTime() {
    var now = new Date();
    var dateElement = document.getElementById('date');
    var timeElement = document.getElementById('time');

    // 현재 날짜 설정
    var year = now.getFullYear();
    var month = now.getMonth() + 1;
    var day = now.getDate();
    var dateString = year + '-' + pad(month) + '-' + pad(day);

    // 현재 시간 설정
    var hours = now.getHours();
    var minutes = now.getMinutes();
    var seconds = now.getSeconds();
    var timeString = pad(hours) + ':' + pad(minutes) + ':' + pad(seconds);

    // DOM 업데이트
    dateElement.textContent = dateString;
    timeElement.textContent = timeString;
}

function pad(number) {
    if (number < 10) {
        return '0' + number;
    }
    return number;
}

// 페이지 로드 후에 1초마다 현재 날짜와 시간 업데이트
window.onload = function () {
    displayDateTime();
    setInterval(displayDateTime, 1000);
};
