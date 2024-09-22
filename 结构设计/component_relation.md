# 数据结构

```mermaid
erDiagram

	ProjectCreation ||--|{ Project: creates
	ProjectCreation {        
        a Create "Create from Empty"
        b Import "Import from Template"
        c Clone "Clone from Public Project"
    }
    
    
	BioModelCreation ||--|{ BioModel: creates
	BioModelCreation {        
        a Create "Create from Empty"
        b Create "Create from Project Creation"
        c Import "Import from Template"
        d Clone "Clone from Public BioModel"
        e Clone "Clone from Public Project"
    }
    BioModel ||--o{ Project: makes
    BioModel {
        a Detail "Components, Paramters and Matrix of a BioModel"
        b Releases "Version Control"
        c Profile "Other related information"
    }
    
    DataSetCreation ||--|{ DataSet: creates
	DataSetCreation {        
        a Create "Create from Empty"
        b Create "Create from Project Creation"
        c Create "Create from Preset"
        d Import "Import from Template"
        e Clone "Clone from Public DataSet"
        f Clone "Clone from Public Project"
    }
    DataSet ||--o{ Project: makes
    DataSet {
        a Detail "Flowchart, Targets, Tanks and Links of a DataSet"
        b Releases "Version Control"
        c Profile "Other related information"
    }
    
    DataSet ||--o{ Project : makes
    
    
    
    Project {
        a Detail "Matrix, Flowchart, Variables, Conversions and Weights of a Project"
        b Calculation "Simulaiton and Evaluation Console"
        c Releases "Version Control"
        d Profile "Other related information"
    }
    
     Project ||--o{ Result : solve
```



# Chemostat

```mermaid
erDiagram
	"Create from Empty" ||--o{ BioModel: creates
	"Create from Project Creation" ||--o{ BioModel: creates
	"Create from Template" ||--o{ BioModel: creates
	"Clone from Public BioModel" ||--o{ BioModel: creates
	"Clone from Public Project" ||--o{ BioModel: creates
	Create {        
        Clone A "Create from Empty"
        Import B "Create from Project Creation"
        Profile C "Create from Template"
        Profile D "Clone from Public BioModel"
        Profile E "Clone from Public Project"
    }
    BioModel ||--o{ Project: makes
    BioModel {
        Detail Detail
        second Releases "Version Control"
        Releases fds "Version Control"
        Profile Profile
    }
    DataSet ||--o{ Project : makes
    DataSet {
        string firstName
        string lastName
        int age
    }
```



# Chemostat with recycling

```mermaid

graph LR;

Inflow(fa:fa-spinner) -->|Qin| AerationTank[(AerationTank)]
%%subgraph TOP
%%direction LR
AerationTank -->|Qin| Outflow(fa:fa-spinner)
Outflow -->|Qr|Inflow


style Inflow fill:#fff,stroke:#333,stroke-width:0px
style Outflow fill:#fff,stroke:#333,stroke-width:0px


```



# Chemostat with recycling2

```mermaid
%%{ init: { 'flowchart': { 'curve': 'stepBefore' }}}%%
graph LR;

Inflow(fa:fa-spinner) -->|Qin| AerationTankIn
%%subgraph TOP
%%direction LR
AerationTankIn(fa:fa-rotate-right) --> AerationTank[(AerationTank)]
%%AerationTankIn(fa:fa-caret-right) --> AerationTank[(AerationTank)]
AerationTank --> AerationTankOut(fa:fa-spinner)

%%Outflow_ -->|Qr|Inflow__(fa:fa-spinner)
%%AerationTankOut(fa:fa-chevron-right) -->|Qr| AerationTankIn


AerationTankOut(fa:fa-chevron-right) -->|Qr| AerationTankIn
%%Outflow(fa:fa-chevron-right) -->|Qr| AerationTankIn
%%end
AerationTankOut -->|Qin| Outflow(fa:fa-spinner)




style Inflow fill:#fff,stroke:#333,stroke-width:0px
style AerationTankIn fill:#fff,stroke:#333,stroke-width:0px
%%style Inflow__ fill:#fff,stroke:#333,stroke-width:0px
style AerationTankOut fill:#fff,stroke:#333,stroke-width:0px
style Outflow fill:#fff,stroke:#333,stroke-width:0px
```



# Chemostat with recycling3

```mermaid
graph LR;

Inflow([Inflow]) -->|Qin| AerationTankIn
%%subgraph TOP
%%direction LR

AerationTankIn(fa:fa-angle-left) --> AerationTank[(AerationTank)]

%%AerationTankIn(fa:fa-rotate-right) --> AerationTank[(AerationTank)]
%%AerationTankIn(fa:fa-arrows-alt) --> AerationTank[(AerationTank)]

%%AerationTankIn(fa:fa-caret-right) --> AerationTank[(AerationTank)]
AerationTank --> AerationTankOut
%%Outflow_ -->|Qr|Inflow__(fa:fa-spinner)

AerationTankOut(fa:fa-angle-right) -->|Qr| AerationTankIn
%%end
AerationTankOut -->|Qin| Outflow([Outflow])




style Inflow fill:#fff,stroke:#333,stroke-width:0.1px
style AerationTankIn fill:#fff,stroke:#333,stroke-width:0px
%%style Inflow__ fill:#fff,stroke:#333,stroke-width:0px
style AerationTankOut fill:#fff,stroke:#333,stroke-width:0px
style Outflow fill:#fff,stroke:#333,stroke-width:0.1px
```



# CAS

```mermaid

graph LR;

%%Inflow(fa:fa-spinner) -->|Qin| AerationTank[(AerationTank)]
Inflow([Inflow]) -->|Qin| AerationTankIn
AerationTankIn(fa:fa-angle-left) --> AerationTank[(AerationTank)]

AerationTank --> PointSettlingTank[\PointSettlingTank/]
%%PointSettlingTank --> PointSettlingTankOut(fa:fa-chevron-right)

%%subgraph TOP
%%direction LR
PointSettlingTank -.-> |Qr| AerationTankIn

%%PointSettlingTankOut -->|Qr| AerationTankIn

%%PointSettlingTank -->|Qin-Qw| Outflow([fa:fa-caret-right Outflow])
%%PointSettlingTank -.->|Qw| Wasted([fa:fa-caret-right Wasted])
PointSettlingTank -->|Qin-Qw| Outflow([Outflow])
PointSettlingTank -.->|Qw| Wasted([Wasted])


%%end

style Inflow fill:#fff,stroke:#333,stroke-width:0.1px
style AerationTankIn fill:#fff,stroke:#333,stroke-width:0px
%%style PointSettlingTankOut fill:#fff,stroke:#333,stroke-width:0px
%%style PointSettlingTankOut2 fill:#fff,stroke:#333,stroke-width:0px
style Outflow fill:#fff,stroke:#333,stroke-width:0.1px
style Wasted fill:#fff,stroke:#333,stroke-width:0.1px

```

 

 

# CAS

```mermaid
graph LR;

%%Inflow(fa:fa-spinner) -->|Qin| AerationTank[(AerationTank)]
Inflow([Inflow]) -->|Qin| AerationTankIn
AerationTankIn(fa:fa-angle-left) --> AerationTank[(AerationTank)]

AerationTank --> PointSettlingTank[\PointSettlingTank/]
%%PointSettlingTank --> PointSettlingTankOut(fa:fa-chevron-right)

%%subgraph TOP
%%direction LR
PointSettlingTank -.-> |Qr| AerationTankIn

%%PointSettlingTankOut -->|Qr| AerationTankIn

%%PointSettlingTank -->|Qin-Qw| Outflow([fa:fa-caret-right Outflow])
%%PointSettlingTank -.->|Qw| Wasted([fa:fa-caret-right Wasted])
PointSettlingTank -->|Qin-Qw| Outflow([Outflow])

%%PointSettlingTank -.->|Qw| Wasted([Wasted])
AerationTank -.->|Qw| Wasted([Wasted])


%%end

style Inflow fill:#fff,stroke:#333,stroke-width:0.1px
style AerationTankIn fill:#fff,stroke:#333,stroke-width:0px
%%style PointSettlingTankOut fill:#fff,stroke:#333,stroke-width:0px
%%style PointSettlingTankOut2 fill:#fff,stroke:#333,stroke-width:0px
style Outflow fill:#fff,stroke:#333,stroke-width:0.1px
style Wasted fill:#fff,stroke:#333,stroke-width:0.1px

```





# CAS3

```mermaid
graph LR;

Inflow(fa:fa-spinner) -->|Qin| AerationTank[(AerationTank)]
%%subgraph TOP
%%direction LR
AerationTank -->|Qin+Qr-Qw| PointSettlingTank[\PointSettlingTank/]
PointSettlingTank -->|Qr| AerationTank
%%end
PointSettlingTank -->|Qin+Qr| Outflow(fa:fa-spinner)
PointSettlingTank -.-o|Qw| Wasted(fa:fa-ban)


style Inflow fill:#fff,stroke:#333,stroke-width:0px
style Outflow fill:#fff,stroke:#333,stroke-width:0px
style Wasted fill:#fff,stroke:#333,stroke-width:0px

```







# CAS2

```mermaid
graph LR;

%%Inflow(fa:fa-spinner) -->|Qin| AerationTank[(AerationTank)]
Inflow(fa:fa-spinner) -->|Qin| AerationTankIn
AerationTankIn(fa:fa-chevron-left) --> AerationTank[(AerationTank)]

AerationTank -->|Qin+Qr-Qw| PointSettlingTank2[\PointSettlingTank/]
%%PointSettlingTank --> PointSettlingTankOut(fa:fa-chevron-right)

subgraph PointSettlingTank2
direction TB
Tank[\PointSettlingTank/] --> Blanket


end

%%subgraph TOP
%%direction LR
%%PointSettlingTank --> Outflow

PointSettlingTank2 -->|Qr| AerationTankIn

PointSettlingTank2 -->|Qin+Qr| Outflow(fa:fa-spinner)
%%PointSettlingTank(fa:fa-spinner) -.-o|Qw| Wasted(fa:fa-ban)


PointSettlingTank2 --> Wasted


style Inflow fill:#fff,stroke:#333,stroke-width:0px
style AerationTankIn fill:#fff,stroke:#333,stroke-width:0px
style PointSettlingTankOut fill:#fff,stroke:#333,stroke-width:0px
%%style PointSettlingTankOut2 fill:#fff,stroke:#333,stroke-width:0px
style Outflow fill:#fff,stroke:#333,stroke-width:0px
style Wasted fill:#fff,stroke:#333,stroke-width:0px

```











-----------


```mermaid
graph LR;
Inflow>Iniflow]-->|Qin|AerationTank[(AerationTank)]


subgraph PointSettlingTank
	Inlet-->Blanket[\Blanket/]
	Inlet-->Outlet[\Outlet/]
    
end
    
AerationTank-->Inlet;
Blanket-->AerationTank;
Outlet-->Outflow;
Blanket-->Wasted;
```



```mermaid
flowchart LR

  subgraph TOP
    direction TB
   
   %% subgraph B2
        %%direction TB
        i2 -->f2
    %%end
  end
  A --> i2
  f2 --> B
   %%  f2 --> A 
  %%B1 --> B2
```









```mermaid
flowchart LR
    A-->B
    B-->C
    C-->D
    click A callback "Tooltip for a callback"
    click B "https://www.github.com" "This is a tooltip for a link"
    click A call callback() "Tooltip for a callback"
    click B href "https://www.github.com" "This is a tooltip for a link"
    
    
```














```mermaid
flowchart LR
    id1(Start)-->id2(Stop)
    style id1 fill:#fff,stroke:#333,stroke-width:0px
    style id2 fill:#bbf,stroke:#f66,stroke-width:0px,color:#fff,stroke-dasharray: 5 5
```

















```mermaid
stateDiagram
    direction LR
    [*] --> AerationTank: Qin
    AerationTank --> PointSettlingTank
    PointSettlingTank --> AerationTank
    state PointSettlingTank {
    
      direction LR
      %%[*] --> OutLet
     %% OutLet --> [*]
      %%[*] --> Blanket
      %%Blanket --> AerationTank
      OutLet --> Blanket
      
      
    }
    PointSettlingTank --> [*]
```



```mermaid
%% 语法示例

        gantt

        dateFormat  YYYY-MM-DD

        title 软件开发甘特图

        section 设计

        需求                      :done,    des1, 2014-01-06,2014-01-08

        原型                      :active,  des2, 2014-01-09, 3d

        UI设计                     :         des3, after des2, 5d

    未来任务                     :         des4, after des3, 5d

        section 开发

        学习准备理解需求                      :crit, done, 2014-01-06,24h

        设计框架                             :crit, done, after des2, 2d

        开发                                 :crit, active, 3d

        未来任务                              :crit, 5d

        耍                                   :2d

    

        section 测试

        功能测试                              :active, a1, after des3, 3d

        压力测试                               :after a1  , 20h

        测试报告                               : 48h
```



```mermaid
mindmap
Root
    A
      B
      C
    C
      A
```





```mermaid
mindmap
  root((mindmap))
    Origins
      Long history
      ::icon(fa fa-book)
      Popularisation
        British popular psychology author Tony Buzan
    Research
      On effectiveness<br/>and features
      On Automatic creation
        Uses
            Creative techniques
            Strategic planning
            Argument mapping
    Tools
      Pen and paper
      Mermaid
```





```mermaid
---
title: Example Git diagram
---
gitGraph
   commit
   commit
   branch develop
   checkout develop
   commit
   commit
   checkout main
   merge develop
   commit
   commit
```

```mermaid
    C4Context
      title System Context diagram for Internet Banking System
      Enterprise_Boundary(b0, "BankBoundary0") {
        Person(customerA, "Banking Customer A", "A customer of the bank, with personal bank accounts.")
        Person(customerB, "Banking Customer B")
        Person_Ext(customerC, "Banking Customer C", "desc")

        Person(customerD, "Banking Customer D", "A customer of the bank, <br/> with personal bank accounts.")

        System(SystemAA, "Internet Banking System", "Allows customers to view information about their bank accounts, and make payments.")

        Enterprise_Boundary(b1, "BankBoundary") {

          SystemDb_Ext(SystemE, "Mainframe Banking System", "Stores all of the core banking information about customers, accounts, transactions, etc.")

          System_Boundary(b2, "BankBoundary2") {
            System(SystemA, "Banking System A")
            System(SystemB, "Banking System B", "A system of the bank, with personal bank accounts. next line.")
          }

          System_Ext(SystemC, "E-mail system", "The internal Microsoft Exchange e-mail system.")
          SystemDb(SystemD, "Banking System D Database", "A system of the bank, with personal bank accounts.")

          Boundary(b3, "BankBoundary3", "boundary") {
            SystemQueue(SystemF, "Banking System F Queue", "A system of the bank.")
            SystemQueue_Ext(SystemG, "Banking System G Queue", "A system of the bank, with personal bank accounts.")
          }
        }
      }

      BiRel(customerA, SystemAA, "Uses")
      BiRel(SystemAA, SystemE, "Uses")
      Rel(SystemAA, SystemC, "Sends e-mails", "SMTP")
      Rel(SystemC, customerA, "Sends e-mails to")

      UpdateElementStyle(customerA, $fontColor="red", $bgColor="grey", $borderColor="red")
      UpdateRelStyle(customerA, SystemAA, $textColor="blue", $lineColor="blue", $offsetX="5")
      UpdateRelStyle(SystemAA, SystemE, $textColor="blue", $lineColor="blue", $offsetY="-10")
      UpdateRelStyle(SystemAA, SystemC, $textColor="blue", $lineColor="blue", $offsetY="-40", $offsetX="-50")
      UpdateRelStyle(SystemC, customerA, $textColor="red", $lineColor="red", $offsetX="-50", $offsetY="20")

      UpdateLayoutConfig($c4ShapeInRow="3", $c4BoundaryInRow="1")


```

```mermaid
pie title Pets adopted by volunteers
    "Dogs" : 386
    "Cats" : 85
    "Rats" : 15
```

```mermaid
gantt
    dateFormat  YYYY-MM-DD
    title       Adding GANTT diagram functionality to mermaid
    excludes    weekends
    %% (`excludes` accepts specific dates in YYYY-MM-DD format, days of the week ("sunday") or "weekends", but not the word "weekdays".)

    section A section
    Completed task            :done,    des1, 2014-01-06,2014-01-08
    Active task               :active,  des2, 2014-01-09, 3d
    Future task               :         des3, after des2, 5d
    Future task2              :         des4, after des3, 5d

    section Critical tasks
    Completed task in the critical line :crit, done, 2014-01-06,24h
    Implement parser and jison          :crit, done, after des1, 2d
    Create tests for parser             :crit, active, 3d
    Future task in critical line        :crit, 5d
    Create tests for renderer           :2d
    Add to mermaid                      :1d
    Functionality added                 :milestone, 2014-01-25, 0d

    section Documentation
    Describe gantt syntax               :active, a1, after des1, 3d
    Add gantt diagram to demo page      :after a1  , 20h
    Add another diagram to demo page    :doc1, after a1  , 48h

    section Last section
    Describe gantt syntax               :after doc1, 3d
    Add gantt diagram to demo page      :20h
    Add another diagram to demo page    :48h
```

```mermaid
---
title: Order example
---
erDiagram
    CUSTOMER ||--o{ ORDER : places
    ORDER ||--|{ LINE-ITEM : contains
    CUSTOMER }|..|{ DELIVERY-ADDRESS : uses
```

```mermaid
erDiagram
    CAR ||--o{ NAMED-DRIVER : allows
    CAR {
        string registrationNumber
        string make
        string model
    }
    PERSON ||--o{ NAMED-DRIVER : is
    PERSON {
        string firstName
        string lastName
        int age
    }
```

```mermaid
---
title: Animal example
---
classDiagram
    note "From Duck till Zebra"
    Animal <|-- Duck
    note for Duck "can fly\ncan swim\ncan dive\ncan help in debugging"
    Animal <|-- Fish
    Animal <|-- Zebra
    Animal : +int age
    Animal : +String gender
    Animal: +isMammal()
    Animal: +mate()
    class Duck{
        +String beakColor
        +swim()
        +quack()
    }
    class Fish{
        -int sizeInFeet
        -canEat()
    }
    class Zebra{
        +bool is_wild
        +run()
    }
```

```mermaid
sequenceDiagram
    participant Alice
    participant Bob
    Alice->>Bob: Hi Bob
    Bob->>Alice: Hi Alice
```





```mermaid
graph TD
linkStyle default interpolate basis
subgraph aa
A[gunung]-->B[NOUN]
C[Krakatau]--> D[NOUN]
E[Yang]-->F[PRON]
G[Pernah]-->H[ADV]
I[meletus] --> J[VERB]
K[mulai]-->L[VERB]
M[terbatuk-batuk] --> N[VERB]
end
subgraph bb
  B --> O[FN]
  D --> O
  F --> O
  J --> O
  L --> P[FV]
  N --> P
end
subgraph cc
  O --> Q[Subject]
  P --> R[Predicate]
end
subgraph dd
 Q-->S[clause]
 R-->S
end
```

