const counter = document.querySelector(".counter-number");

async function updateCounter() {
    try {
        let response = await fetch("https://trhk3tdy433ehuyhsz5nkiimya0pzhsy.lambda-url.us-east-1.on.aws/");
        let data = await response.json();
        counter.innerHTML = `Views: ${data}`;
    } catch (error) {
        console.error("There was a problem fetching or parsing the data:", error);
    }
}

updateCounter(); // Call the function to update the counter
