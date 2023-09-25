<?php

namespace App\View\Components\coi\view;

use Illuminate\View\Component;

class Loadtest extends Component
{
    public $technical;
    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct($technical)
    {
        $this->technical = $technical;
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        return view('components.coi.view.loadtest');
    }
}
