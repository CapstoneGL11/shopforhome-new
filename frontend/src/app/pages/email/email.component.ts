import { Component, OnInit } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Component({
  selector: 'app-email',
  templateUrl: './email.component.html',
  styleUrls: ['./email.component.css']
})
export class EmailComponent implements OnInit {

  constructor(private https: HttpClient){ }

  ngOnInit() {
  }

  title = 'EmailTemplate';
  dataset: Details = {
    
    recipient:'',
    subject:'',
    msgBody:''
  };

  dataset1 : Details;

  

  onSubmit(){
   

    console.log(this.dataset,);
    this.https.post('http://localhost:9090/sendMail', this.dataset,{  responseType:'text'}).subscribe(
        (res) => {
          //this.dataset = res;
          console.log(res);
          alert('Email Sent successfully');
          
          this.dataset.recipient = '';
          this.dataset.subject = '';
          this.dataset.msgBody = '';
        },(err)=>{
          console.log(err);
          alert('Email Sent Failed');

        });
        
  }
}
interface Details{
  
  recipient:string;
  subject:string;
  msgBody:string;
}




