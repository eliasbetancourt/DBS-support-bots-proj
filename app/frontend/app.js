// Main Application Logic
(function() {
  'use strict';

  // Application State
  const state = {
    currentSection: 'tables',
    currentTable: null,
    currentQuery: null,
    isEditingQuery: false,
    customQueries: []
  };

  // Initialize Application
  function init() {
    initTheme();
    initNavigation();
    initTables();
    initQueries();
    loadSection('tables');
  }

  // Theme Management
  function initTheme() {
    const savedTheme = localStorage.getItem('theme') || 'light';
    document.documentElement.setAttribute('data-theme', savedTheme);
    
    const themeToggle = document.getElementById('themeToggle');
    themeToggle.addEventListener('click', toggleTheme);
  }

  function toggleTheme() {
    const currentTheme = document.documentElement.getAttribute('data-theme');
    const newTheme = currentTheme === 'light' ? 'dark' : 'light';
    document.documentElement.setAttribute('data-theme', newTheme);
    localStorage.setItem('theme', newTheme);
  }

  // Navigation Management
  function initNavigation() {
    const navButtons = document.querySelectorAll('.nav-btn');
    navButtons.forEach(btn => {
      btn.addEventListener('click', () => {
        const section = btn.dataset.section;
        loadSection(section);
      });
    });
  }

  function loadSection(sectionName) {
    // Update navigation
    document.querySelectorAll('.nav-btn').forEach(btn => {
      btn.classList.toggle('active', btn.dataset.section === sectionName);
    });

    // Update content sections
    document.querySelectorAll('.content-section').forEach(section => {
      section.classList.remove('active');
    });
    document.getElementById(`${sectionName}-section`).classList.add('active');

    state.currentSection = sectionName;
  }

  // Tables Section
  function initTables() {
    const tabsContainer = document.getElementById('tableTabs');
    
    schema.tables.forEach((table, index) => {
      const tab = document.createElement('button');
      tab.className = 'table-tab';
      tab.textContent = table.name;
      tab.dataset.table = index;
      
      if (index === 0) {
        tab.classList.add('active');
        state.currentTable = index;
      }
      
      tab.addEventListener('click', () => {
        document.querySelectorAll('.table-tab').forEach(t => t.classList.remove('active'));
        tab.classList.add('active');
        state.currentTable = index;
        displayTableDetails(table);
      });
      
      tabsContainer.appendChild(tab);
    });

    // Display first table by default
    if (schema.tables.length > 0) {
      displayTableDetails(schema.tables[0]);
    }
  }

  function displayTableDetails(table) {
    const detailsContainer = document.getElementById('tableDetails');
    
    const html = `
      <div class="table-info">
        <h3>${table.name}</h3>
        <p class="description">${table.description}</p>
        
        <div class="table-section">
          <h4>Columns</h4>
          <table class="columns-table">
            <thead>
              <tr>
                <th>Column Name</th>
                <th>Data Type</th>
                <th>Constraints</th>
              </tr>
            </thead>
            <tbody>
              ${table.columns.map(col => `
                <tr>
                  <td><strong>${col.name}</strong></td>
                  <td><span class="type-badge">${col.type}</span></td>
                  <td>${col.constraints || '-'}</td>
                </tr>
              `).join('')}
            </tbody>
          </table>
        </div>
        
        ${table.relationships.length > 0 ? `
          <div class="table-section">
            <h4>Relationships</h4>
            <table class="relationships-table">
              <thead>
                <tr>
                  <th>Relationship Type</th>
                  <th>Related Table</th>
                  <th>Description</th>
                </tr>
              </thead>
              <tbody>
                ${table.relationships.map(rel => `
                  <tr>
                    <td><strong>${rel.type}</strong></td>
                    <td>${rel.with}</td>
                    <td>${rel.description}</td>
                  </tr>
                `).join('')}
              </tbody>
            </table>
          </div>
        ` : ''}
      </div>
    `;
    
    detailsContainer.innerHTML = html;
  }

  // Queries Section
  function initQueries() {
    const tabsContainer = document.getElementById('queryTabs');
    
    // Add pre-defined query tabs
    queries.forEach((query, index) => {
      const tab = document.createElement('button');
      tab.className = 'query-tab';
      tab.textContent = query.name;
      tab.dataset.queryIndex = index;
      
      if (index === 0) {
        tab.classList.add('active');
        state.currentQuery = query;
      }
      
      tab.addEventListener('click', () => {
        document.querySelectorAll('.query-tab').forEach(t => t.classList.remove('active'));
        tab.classList.add('active');
        state.currentQuery = query;
        displayQueryDetails(query);
      });
      
      tabsContainer.appendChild(tab);
    });

    // Add "Create Query" button
    const createTab = document.createElement('button');
    createTab.className = 'query-tab create-query';
    createTab.textContent = '+ Create Query';
    createTab.addEventListener('click', createNewQuery);
    tabsContainer.appendChild(createTab);

    // Display first query by default
    if (queries.length > 0) {
      displayQueryDetails(queries[0]);
    }

    // Setup query action buttons
    document.getElementById('editQueryBtn').addEventListener('click', enableQueryEdit);
    document.getElementById('saveQueryBtn').addEventListener('click', saveQuery);
    document.getElementById('cancelEditBtn').addEventListener('click', cancelQueryEdit);
    document.getElementById('executeQueryBtn').addEventListener('click', executeQuery);
  }

  function displayQueryDetails(query) {
    state.isEditingQuery = false;
    
    document.getElementById('queryName').textContent = query.name;
    document.getElementById('queryDescription').textContent = query.description;
    document.getElementById('queryCode').textContent = query.sql;
    
    // Show/hide appropriate buttons
    document.getElementById('editQueryBtn').style.display = 'inline-block';
    document.getElementById('executeQueryBtn').style.display = 'inline-block';
    document.getElementById('saveQueryBtn').style.display = 'none';
    document.getElementById('cancelEditBtn').style.display = 'none';
    
    // Show code display, hide editor
    document.getElementById('queryCode').style.display = 'block';
    document.getElementById('queryEditor').style.display = 'none';
    
    // Hide results
    document.getElementById('queryResults').style.display = 'none';
  }

  function createNewQuery() {
    const newQuery = {
      id: `custom_${Date.now()}`,
      name: 'New Query',
      description: 'Enter your query description here',
      sql: '-- Write your SQL query here\nSELECT * FROM Bot LIMIT 10;',
      category: 'Custom',
      isCustom: true
    };
    
    state.customQueries.push(newQuery);
    state.currentQuery = newQuery;
    
    displayQueryDetails(newQuery);
    enableQueryEdit();
  }

  function enableQueryEdit() {
    state.isEditingQuery = true;
    
    const queryCode = document.getElementById('queryCode');
    const queryEditor = document.getElementById('queryEditor');
    
    queryEditor.value = queryCode.textContent;
    queryCode.style.display = 'none';
    queryEditor.style.display = 'block';
    queryEditor.focus();
    
    // Update buttons
    document.getElementById('editQueryBtn').style.display = 'none';
    document.getElementById('executeQueryBtn').style.display = 'none';
    document.getElementById('saveQueryBtn').style.display = 'inline-block';
    document.getElementById('cancelEditBtn').style.display = 'inline-block';
  }

  function saveQuery() {
    const queryEditor = document.getElementById('queryEditor');
    state.currentQuery.sql = queryEditor.value;
    
    displayQueryDetails(state.currentQuery);
    
    // Show success message (simple alert for now)
    showMessage('Query saved successfully!', 'success');
  }

  function cancelQueryEdit() {
    displayQueryDetails(state.currentQuery);
  }

  function executeQuery() {
    const resultsContainer = document.getElementById('resultsContainer');
    const resultsSection = document.getElementById('queryResults');
    
    resultsSection.style.display = 'block';
    resultsContainer.innerHTML = '<div class="empty-state"><div class="empty-state-text"><p>Executing query...</p></div></div>';
    
    // Make API call to backend
    fetch('http://localhost:3000/api/query', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ sql: state.currentQuery.sql })
    })
    .then(res => {
      if (!res.ok) {
        throw new Error(`HTTP error! status: ${res.status}`);
      }
      return res.json();
    })
    .then(data => displayQueryResults(data))
    .catch(err => {
      resultsContainer.innerHTML = `
        <div class="empty-state">
          <div class="empty-state-icon">⚠️</div>
          <div class="empty-state-text">
            <p><strong>Query execution failed</strong></p>
            <p>${err.message}</p>
            <p>Make sure the backend server is running at <code>http://localhost:3000</code></p>
          </div>
        </div>
      `;
    });
  }

  function displayQueryResults(data) {
    const resultsContainer = document.getElementById('resultsContainer');
    
    if (!data || data.length === 0) {
      resultsContainer.innerHTML = `
        <div class="empty-state">
          <div class="empty-state-icon">📭</div>
          <div class="empty-state-text">No results found</div>
        </div>
      `;
      return;
    }
    
    // Get column names from first row
    const columns = Object.keys(data[0]);
    
    const tableHTML = `
      <table class="results-table">
        <thead>
          <tr>
            ${columns.map(col => `<th>${col}</th>`).join('')}
          </tr>
        </thead>
        <tbody>
          ${data.map(row => `
            <tr>
              ${columns.map(col => `<td>${row[col] !== null ? row[col] : '<em>NULL</em>'}</td>`).join('')}
            </tr>
          `).join('')}
        </tbody>
      </table>
    `;
    
    resultsContainer.innerHTML = tableHTML;
  }

  function showMessage(message, type = 'info') {
    // Create a toast notification element
    const toast = document.createElement('div');
    toast.className = `toast toast-${type}`;
    toast.textContent = message;
    document.body.appendChild(toast);
    
    // Show the toast
    setTimeout(() => toast.classList.add('show'), 10);
    
    // Remove the toast after 3 seconds
    setTimeout(() => {
      toast.classList.remove('show');
      setTimeout(() => toast.remove(), 300);
    }, 3000);
  }

  // Initialize the application when DOM is ready
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
