import React, { Component } from 'react';
import {Navbar,Nav,NavDropdown,Form,FormControl,Button} from 'react-bootstrap'

//const SignOutButton=()=>();

const NavigationAuth=()=>(<Nav>
    <Nav.Link  href="/session/new">Login</Nav.Link>
   <Nav.Link  href="/users/new">Register</Nav.Link>
</Nav>);

const NavigationNonAuth=(props)=>(<Nav >
    <Nav.Link href="/profile_page" className="btn btn-light " style={{minWidth:"100px"}}><span>{props.username}</span></Nav.Link>
    <Button variant="light" type="reset" onClick={props.izlogujSe}>Izloguj se</Button>
    </Nav>);

class Navigation extends Component {
    constructor(props){
        super(props);
       
    }
    izlogujSe(){
        const token=document.querySelector('meta[name="csrf-token"]').content;
        fetch("/session",{
            method:"DELETE",
            headers:{
                "X-CSRF-Token":token,
                "Content-Type":"application/json"
            }
        }).then(response=>{
            if(!response.ok){
                throw new Error("Network response was not OK");
            }
            else{
             window.location.href="/";
            }
        }).catch(error=>console.log(error.message))
        
    }
    render() { 
        return ( <Navbar className="mb-5" bg="light" variant="light" expand="lg">
            <Navbar.Brand  href="/">Knjigovodstveni sistem</Navbar.Brand>
            <Navbar.Toggle aria-controls="basic-navbar-nav" />
            <Navbar.Collapse id="basic-navbar-nav">
            <Nav className="mr-auto">
            <Nav.Link href="/kontrolni_broj">Kontrolni broj</Nav.Link>
            <NavDropdown title="Kontni okvir" id="basic-nav-dropdown">
            <NavDropdown.Item href="/konto_klasas">Konto1 Klasa</NavDropdown.Item>
            <NavDropdown.Item href="/konto_grupas">Konto2 Grupa</NavDropdown.Item>
            <NavDropdown.Item href="/konto_sintetikas">Konto3 Sintetika</NavDropdown.Item>
            <NavDropdown.Item href="/konto_objektas">Konto4 Objekti prometa</NavDropdown.Item>
            <NavDropdown.Item href="/konto_racunis">Konto5 Racuni</NavDropdown.Item>
            </NavDropdown>
            <Nav.Link href="/kursna_lista">Kursna lista</Nav.Link>
            <Nav.Link href="/partneris">Partneri</Nav.Link>
            <Nav.Link href="/poreske_tarifes">Poreske tarife</Nav.Link>
            <Nav.Link href="/robas">Robe</Nav.Link>
            <Nav.Link href="/tip_robes">Tip robe</Nav.Link>
            <Nav.Link href="/magacinis">Magacini</Nav.Link>
            </Nav>
            <Nav>
             {this.props.current_user==null ? <NavigationAuth /> : <NavigationNonAuth username={this.props.current_user} izlogujSe={this.izlogujSe} />}  
            </Nav>
            </Navbar.Collapse>
        </Navbar> );
    }
}
 
export default Navigation;