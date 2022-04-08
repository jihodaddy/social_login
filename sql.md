# MySQL 쿼리문

<pre><code>
CREATE SCHEMA security DEFAULT CHARACTER SET utf8;   

use security;   

create TABLE member (   
idx int not null PRIMARY KEY AUTO_INCREMENT,   
email VARCHAR(30),   
name VARCHAR(30),   
provider VARCHAR(30),   
redistDate TIMESTAMP DEFAULT now(),    
profile VARCHAR(255),   
grade VARCHAR(30)   
);   
</code></pre>
