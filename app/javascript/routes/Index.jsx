import React from 'react';
import {BrowserRouter as Router,Route,Switch} from 'react-router-dom';
import Home from '../components/Home';
import Footer from '../components/shared/Footer';

export default(
    <Router>
        
        <Switch>
            <Route path="/" exact component={Home} ></Route>
        </Switch>
        <Footer />
    </Router>
)