<?php

namespace App\View\Components\boq;

use Illuminate\View\Component;

class Peralatan extends Component
{
    public $list, $po, $type;
    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct($list, $po, $type)
    {
        $this->list = $list;
        $this->po = $po;
        $this->type = $type;
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        return view('components.boq.peralatan');
    }
}
