// Load Bots
fetch("http://localhost:3000/api/bots")
  .then(res => res.json())
  .then(data => {
    const container = document.getElementById("botList");
    container.innerHTML = data.map(bot =>
      `<li>${bot.BotName} (${bot.BotType}) – ${bot.ServiceStartDate}</li>`
    ).join("");
  });

// Load Owners & Bots
fetch("http://localhost:3000/api/owners")
  .then(res => res.json())
  .then(data => {
    const container = document.getElementById("ownerList");
    container.innerHTML = data.map(item =>
      `<li>${item.CompanyName} → ${item.BotName}</li>`
    ).join("");
  });

// Load User Usage History
fetch("http://localhost:3000/api/users")
  .then(res => res.json())
  .then(data => {
    const container = document.getElementById("userList");
    container.innerHTML = data.map(row =>
      `<li>${row.FirstName} ${row.LastName} used ${row.BotName} on ${row.FirstUseDate}</li>`
    ).join("");
  });
