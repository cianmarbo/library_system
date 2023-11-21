const loginForm = document.getElementById('login-form');

loginForm.addEventListener('submit', async event => {
    event.preventDefault();
  
    const loginFromData = new FormData(loginForm);
  
    const loginData = {};
    for (let [key, value] of loginFromData.entries()) {
      loginData[key] = value;
    }
  
    fetch('http://127.0.0.1:3000/login', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(loginData)
    })
    .then(res => res.json())
    .then(data => {
        console.log('Server response:', data);

        if (data.message.indexOf("SUCCESS") !== -1) {
            window.location.href = 'http://127.0.0.1:3000/library_home.html';
        } else {
            alert("The username or password you have entered is not correct or you do not have an account with us. If you do not have an account with us, please give us a ring and we can get you set up!")
        }

    })
    .catch(error => {
      console.error('Error:', error);
    });
  });