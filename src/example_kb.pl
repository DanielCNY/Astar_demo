% Sample knowledge base, example: document taxonomy  
kb_example([  
  [home, about, contact],  
  [about, team, history],  
  [contact, email, phone],  
  [team, john, mary]  
]).  

% Sample query: Find path from 'home' to 'mary'  
% ?- astar([home], Path, Cost, kb_example).